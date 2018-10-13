module Freefeed
  class Comment < ResourceKitling::Resource
    actions do
      action :create do
        verb :post
        version :v1
        path '/comments'
      end
      action :update do
        verb :put
        version :v1
        path '/comments/:id'
      end
      action :destroy do
        verb :delete
        version :v1
        path '/comments/:id'
      end
      action :like do
        verb :post
        version :v2
        path '/comments/:id/like'
      end
      action :unlike do
        verb :post
        version :v2
        path '/comments/:id/unlike'
      end
      action :likes do
        verb :get
        version :v2
        path '/comments/:id/likes'
      end
    end
  end
end
