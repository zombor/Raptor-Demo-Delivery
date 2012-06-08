module MyKissList
  module Context
    class CreateUser
      def self.execute(user, params)
        raise Raptor::ValidationError if params['email'].empty? || params['password'].empty?
        user.email = params['email']
        user.password = params['password']
        user.extend(UnregisteredUser).register

        {:status => :success, :user => @user}
      end

      protected

      module UnregisteredUser
        def register
          Arden::Repository.for(:user).create(self)
        end
      end
    end
  end
end
