module Freefeed
  class Stat < ResourceKitling::Resource
    actions do
      action :stats do
        verb :get
        version :v2
        path '/stats'
      end
    end
  end
end
