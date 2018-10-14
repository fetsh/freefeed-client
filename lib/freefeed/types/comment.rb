require 'dry-types'
require 'dry-struct'
module Freefeed
  module Types
    class CommentCreate < Dry::Struct
      attribute :comment do
        attribute :body, Types::Body
        attribute :postId, Types::UID
      end
    end

    class CommentUpdate < Dry::Struct
      attribute :comment do
        attribute :body, Types::Body
      end
    end
  end
end
