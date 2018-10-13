module Freefeed
  class Post < ResourceKitling::Resource
    actions do
      action :create do
        verb :post
        version :v1
        path '/posts'
      end
      action :get do
        verb :get
        version :v2
        path '/posts/:id'
      end
      action :update do
        verb :put
        version :v1
        path '/posts/:id'
      end
      action :destroy do
        verb :delete
        version :v1
        path '/posts/:id'
      end
      action :like do
        verb :post
        version :v1
        path '/posts/:id/like'
      end
      action :unlike do
        verb :post
        version :v1
        path '/posts/:id/unlike'
      end
      action :hide do
        verb :post
        version :v1
        path '/posts/:id/hide'
      end
      action :unhide do
        verb :post
        version :v1
        path '/posts/:id/unhide'
      end
      action :disable_comments do
        verb :post
        version :v1
        path '/posts/:id/disableComments'
      end
      action :enable_comments do
        verb :post
        version :v1
        path '/posts/:id/enableComments'
      end
      action :opengraph do
        verb :get
        version :v2
        path '/posts-opengraph/:id'
      end
    end
  end
end
