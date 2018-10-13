module Freefeed
  class Bookmarklet < ResourceKitling::Resource
    actions do
      action :create do
        verb :post
        version :v1
        path '/bookmarklet'
      end
    end
  end
end
