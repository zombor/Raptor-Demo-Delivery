require 'context/create_user'

module MyKissList
  # A delegator is an intermediate delivery mechanism class
  # that can do any conversion needed,i pre-validation
  # or handle session/cookie junk.
  module Delegator
    class User
      def self.create(user, params)
        MyKissList::Context::CreateUser.execute(user, params)
      end
    end
  end
end
