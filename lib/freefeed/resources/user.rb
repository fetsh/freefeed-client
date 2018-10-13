module Freefeed
  class User < ResourceKitling::Resource
    actions do
      action :create do
        verb :post
        version :v1
        path '/users'
      end
      action :sudo_create do
        verb :post
        version :v1
        path '/users/sudo'
      end
      action :send_request do
        verb :post
        version :v1
        path '/users/:username/sendRequest'
      end
      action :revoke_request do
        verb :post
        version :v2
        path '/requests/:username/revoke'
      end
      action :accept_request do
        verb :post
        version :v1
        path '/users/acceptRequest/:username'
      end
      action :reject_request do
        verb :post
        version :v1
        path '/users/rejectRequest/:username'
      end
      action :unsubscribe_from_me do
        verb :post
        version :v1
        path '/users/:username/unsubscribeFromMe'
      end
      action :show do
        verb :get
        version :v1
        path '/users/:username'
      end
      action :update_password do
        verb :put
        version :v1
        path '/users/updatePassword'
      end
      action :update_profile_picture do
        verb :post
        version :v1
        path '/users/updateProfilePicture'
      end
      action :update do
        verb :put
        version :v1
        path '/users/:id'
      end
      action :ban do
        verb :post
        version :v1
        path '/users/:username/ban'
      end
      action :unban do
        verb :post
        version :v1
        path '/users/:username/unban'
      end
      action :subscribe do
        verb :post
        version :v1
        path '/users/:username/subscribe'
      end
      action :unsubscribe do
        verb :post
        version :v1
        path '/users/:username/unsubscribe'
      end
      action :subscribers do
        verb :get
        version :v1
        path '/users/:username/subscribers'
      end
      action :subscriptions do
        verb :get
        version :v1
        path '/users/:username/subscriptions'
      end
      action :blocked do
        verb :get
        version :v2
        path '/users/blockedByMe'
      end
      action :unread_directs_number do
        verb :get
        version :v2
        path '/users/getUnreadDirectsNumber'
      end
      action :unread_notifications_number do
        verb :get
        version :v2
        path '/users/getUnreadNotificationsNumber'
      end
      action :mark_all_directs_as_read do
        verb :get
        version :v2
        path '/users/markAllDirectsAsRead'
      end
      action :mark_all_notifications_as_read do
        verb :post
        version :v2
        path '/users/markAllNotificationsAsRead'
      end
      action :whoami do
        verb :get
        version :v2
        path '/users/whoami'
      end
    end
  end
end
