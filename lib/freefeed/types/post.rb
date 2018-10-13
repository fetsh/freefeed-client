require 'dry-types'
require 'dry-struct'
module Freefeed
  module Types
    class PostCreate < Dry::Struct
      attribute :post, Types::Hash.schema(
        body: Types::Body,
        attachments: Types::Attachments.meta(omittable: true)
      )
      attribute :meta, Types::Hash.schema(
        commentsDisabled: Types::Strict::Bool.default(false),
        feeds: Types::AccountName | Types::Feeds
      )
    end

    class PostUpdate < Dry::Struct
      attribute :post, Types::Hash.schema(
        body: Types::Body.meta(omittable: true),
        attachments: Types::Attachments.meta(omittable: true),
        feeds: Types::Feeds.meta(omittable: true)
      )
    end
  end
end
