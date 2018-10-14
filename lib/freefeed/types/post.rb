require 'dry-types'
require 'dry-struct'
module Freefeed
  module Types
    class PostCreate < Dry::Struct
      attribute :post do
        attribute :body, Types::Body
        attribute :attachments, Types::Attachments.meta(omittable: true)
      end
      attribute :meta do
        attribute :commentsDisabled, Types::Strict::Bool.default(false)
        attribute :feeds, Types::AccountName | Types::Feeds
      end
    end

    class PostUpdate < Dry::Struct
      attribute :post do
        attribute :body, Types::Body.meta(omittable: true)
        attribute :attachments, Types::Attachments.meta(omittable: true)
        attribute :feeds, Types::Feeds.meta(omittable: true)
      end
    end
  end
end
