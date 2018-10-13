module Freefeed
  class Group < ResourceKitling::Resource
    actions do
      action :create do
        verb :post
        version :v1
        path '/groups'
      end
      action :sudo_create do
        verb :post
        version :v1
        path '/groups/sudo'
      end
      action :update_profile_picture do
        verb :post
        version :v1
        path '/groups/:name/updateProfilePicture'
      end
      action :admin do
        verb :post
        version :v1
        path '/groups/:name/subscribers/:username/admin'
      end
      action :unadmin do
        verb :post
        version :v1
        path '/groups/:name/subscribers/:username/unadmin'
      end
      action :send_request do
        verb :post
        version :v1
        path '/groups/:name/sendRequest'
      end
      action :accept_request do
        verb :post
        version :v1
        path '/groups/:name/acceptRequest/:username'
      end
      action :reject_request do
        verb :post
        version :v1
        path '/groups/:name/rejectRequest/:username'
      end
      action :unsubscribe_from_group do
        verb :post
        version :v1
        path '/groups/:name/unsubscribeFromGroup/:username'
      end
      action :manage do
        verb :get
        version :v2
        path '/managedGroups'
      end
      action :all do
        verb :get
        version :v2
        path '/allGroups'
      end
    end
  end
end
