module MyKissList
  module Context
    class CreateUser
      def initialize(user)
        @user = user
      end

      def execute
        @user.extend(UnregisteredUser).register

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
