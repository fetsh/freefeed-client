module Freefeed
  class Notification < ResourceKitling::Resource
    actions do
      action :all do
        verb :get
        version :v2
        path '/notifications'
      end
    end
  end
end
