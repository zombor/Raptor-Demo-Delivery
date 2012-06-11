require 'error/not_found'
require 'error/validation'

module MyKissList
  module Delegator
    class Session
      # Log the user in
      def self.create(params, rack_env)
        user = Arden::Repository.for(:user).find_by_email(params['email'])

        if user.nil?
          raise Error::NotFound
        end

        if user.password == params[:password]
          rack_env['rack.session'][:user_id] = user.id
        else
          raise Error::Validation.new(:email => 'Invalid username or password')
        end
      end
    end
  end
end
