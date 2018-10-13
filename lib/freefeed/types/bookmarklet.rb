require 'dry-types'
require 'dry-struct'
module Freefeed
  module Types
    class Bookmarklet < Dry::Struct
      attribute :title, Types::Body
      attribute :comment, Types::Strict::String.meta(omittable: true)
      attribute :image, Types::Strict::String.meta(omittable: true)
      attribute :images, Types::Strict::Array.of(
        Types::Strict::String
      ).meta(omittable: true)
      attribute :meta, Types::Hash.schema(
        feeds: Types::AccountName | Types::Feeds
      ).meta(omittable: true)
    end
  end
end
