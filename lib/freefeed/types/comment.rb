require 'dry-types'
require 'dry-struct'
module Freefeed
  module Types
    class CommentCreate < Dry::Struct
      attribute :comment, Types::Hash.schema(
        body: Types::Body,
        postId: Types::UID
      )
    end

    class CommentUpdate < Dry::Struct
      attribute :comment, Types::Hash.schema(body: Types::Body)
    end
  end
end
