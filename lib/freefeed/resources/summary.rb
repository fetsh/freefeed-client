module Freefeed
  class Summary < ResourceKitling::Resource
    actions do
      action :general do
        verb :get
        version :v2
        path '/summary/:days'
      end
      action :by_user do
        verb :get
        version :v2
        path '/summary/:username/:days'
      end
    end
  end
end
