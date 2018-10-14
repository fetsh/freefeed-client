module ResourceKitling
  require 'forwardable'
  class ActionCollection
    extend Forwardable
    def_delegators :@collection, :find, :<<, :each, :include?, :map
    def initialize
      @collection = []
    end

    def action(name, &block)
      action = Action.new(name)
      action.instance_eval(&block) if block_given?
      action.tap { |a| @collection << a }
    end
  end

  class Action
    attr_reader :name

    def initialize(name)
      @name = name
      @verb = :get
      @version = 'v1'
      @path = path
    end

    def verb(v = nil)
      @verb = v if v
      @verb
    end

    def version(v = nil)
      @version = v if v
      @version
    end

    def path(path = nil, &block)
      raise "You must pass either a block or a string for paths" if path and block_given?
      @path = path if path
      @path = block if block_given?
      @path
    end

    def generated_path(values = {})
      values.inject("/#{version}/#{path}") do |np, (key, value)|
        np.gsub(":#{key}", value.to_s)
      end
    end

    def to_s
      name
    end
  end
  class Resource
    class << self
      attr_accessor :_actions
      attr_reader :subclasses
      def inherited(subclass)
        superclass.inherited(subclass) if superclass.respond_to?(:inherited)
        @subclasses ||= []
        @subclasses << subclass
      end
    end

    def self.actions(&block)
      self._actions ||= ActionCollection.new
      if block_given?
        self._actions.instance_eval(&block)
        self._actions.each do |action|
          if respond_to?(action.name.to_sym)
            raise(
              ArgumentError,
              "Action '#{action.name}' is already defined on `#{self}`"
            )
          end
          method_block = method_for_action(action)
          send(:define_singleton_method, action.name, &method_block)
        end
      end
      self._actions
    end

    def self.method_for_action(action)
      Proc.new do |*args|
        client = args.shift
        pathopts = action.path.include?(':') ? args.shift : {}
        payload = args.shift
        payload = payload.to_h if payload.respond_to?(:to_h)
        client.call!(
          action.verb, action.generated_path(pathopts), payload, *args
        )
      end
    end

    def actions
      self.class.actions
    end

    def initialize
    end
  end
end
