module Freefeed
  class Session < ResourceKitling::Resource
    actions do
      action :create do
        verb :post
        version :v1
        path '/session'
      end
    end
  end
end
