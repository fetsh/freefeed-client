module Freefeed
  class Invitation < ResourceKitling::Resource
    actions do
      action :create do
        verb :post
        version :v2
        path '/invitations'
      end
      action :get do
        verb :get
        version :v2
        path '/invitations/:id'
      end
    end
  end
end
