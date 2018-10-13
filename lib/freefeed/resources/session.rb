module Freefeed
  class Session < ResourceKitling::Resource
    actions do
      action :create do
        verb :post
        version :v1
        path '/sessions'
      end
    end
  end
end
