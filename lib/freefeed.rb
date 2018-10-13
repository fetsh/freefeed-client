require 'faraday'
require 'faraday_middleware'
require 'logger'
require 'multi_json'
require 'resource_kitling'
require 'freefeed/version'
require 'freefeed/exceptions'
require 'freefeed/client'
require 'active_support/inflector'

require 'freefeed/resources/archive'
require 'freefeed/resources/attachment'
require 'freefeed/resources/bookmarklet'
require 'freefeed/resources/comment'
require 'freefeed/resources/group'
require 'freefeed/resources/invitation'
require 'freefeed/resources/notification'
require 'freefeed/resources/password'
require 'freefeed/resources/post'
require 'freefeed/resources/request'
require 'freefeed/resources/search'
require 'freefeed/resources/session'
require 'freefeed/resources/stat'
require 'freefeed/resources/summary'
require 'freefeed/resources/timeline'
require 'freefeed/resources/user'

require 'freefeed/types'
require 'freefeed/types/bookmarklet'
require 'freefeed/types/comment'
require 'freefeed/types/post'

ResourceKitling::Resource.subclasses.each do |sc|
  mn = sc.to_s.downcase.split('::').last.pluralize
  if Freefeed::Client.method_defined?(mn)
    raise(
      ArgumentError,
      "Method '#{mn}' is already defined on Freefeed::Client"
    )
  end
  Freefeed::Client.send(:define_method, mn) do
    instance_variable_get("@#{mn}") || instance_variable_set(
      "@#{mn}", sc.new(client: self)
    )
  end
end
