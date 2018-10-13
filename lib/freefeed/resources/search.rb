module Freefeed
  class Search < ResourceKitling::Resource
    actions do
      action :search do
        verb :get
        version :v2
        path '/search'
      end
    end
  end
end
