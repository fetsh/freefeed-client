module Freefeed
  class Attachment < ResourceKitling::Resource
    actions do
      action :create do
        verb :post
        version :v1
        path '/attachments'
      end
    end
  end
end
