module Freefeed
  class Timeline < ResourceKitling::Resource
    actions do
      action :bestof do
        verb :get
        version :v2
        path '/bestof'
      end
      action :home do
        verb :get
        version :v2
        path '/timelines/home'
      end
      action :discussions do
        verb :get
        version :v2
        path '/timelines/filter/discussions'
      end
      action :directs do
        verb :get
        version :v2
        path '/timelines/filter/directs'
      end
      action :posts do
        verb :get
        version :v2
        path '/timelines/:username'
      end
      action :likes do
        verb :get
        version :v2
        path '/timelines/:username/likes'
      end
      action :comments do
        verb :get
        version :v2
        path '/timelines/:username/comments'
      end
    end
  end
end
