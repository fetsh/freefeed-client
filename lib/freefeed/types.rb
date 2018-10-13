require 'dry-types'
require 'dry-struct'
module Freefeed
  module Types
    include Dry::Types.module

    Body = Types::Strict::String.constrained(min_size: 1, format: %r{\S+})
    UID = Types::Strict::String.constrained(
      format: %r{^[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}$}
    )
    UserName = Types::Strict::String.constrained(
      min_size: 3, max_size: 25, format: %r{^[A-Za-z0-9]+$}
    )
    GroupName = Types::Strict::String.constrained(
      min_size: 3, max_size: 25, format: %r{^[A-Za-z0-9]+(-[a-zA-Z0-9]+)*$}
    )
    AccountName = UserName | GroupName
    Attachments = Types::Strict::Array.of(UID)
    Feeds = Types::Strict::Array.of(AccountName)
  end
end
