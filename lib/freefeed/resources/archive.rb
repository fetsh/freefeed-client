module Freefeed
  class Archive < ResourceKitling::Resource
    actions do
      action :restoration do
        verb :post
        version :v2
        path '/archives/restoration'
      end
      action :activities do
        verb :put
        version :v2
        path '/archives/activities'
      end
      action :post_by_old_name do
        verb :get
        version :v2
        path '/archives/post-by-old-name/:name'
      end
      action :stats do
        verb :get
        version :v2
        path '/archives-stats'
      end
    end
  end
end
