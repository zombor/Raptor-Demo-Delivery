require 'context/create_user'

module MyKissList
  module Delegator
    class CreateUser
      def self.execute(rack_env, user, params)
        puts rack_env['rack.session'][:foo].inspect
        rack_env['rack.session'][:foo] = :bar

        MyKissList::Context::CreateUser.execute(user, params)
      end
    end
  end
end
