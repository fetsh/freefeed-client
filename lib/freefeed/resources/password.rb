module Freefeed
  class Password < ResourceKitling::Resource
    actions do
      action :create do
        verb :post
        version :v1
        path '/passwords'
      end
      action :update do
        verb :put
        version :v1
        path '/passwords/:token'
      end
    end
  end
end
