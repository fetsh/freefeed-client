module Freefeed
  class Request < ResourceKitling::Resource
    actions do
      action :revoke do
        verb :post
        version :v2
        path '/requests/:username/revoke'
      end
    end
  end
end
