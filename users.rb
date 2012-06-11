module MyKissList
  module Presenters
    class HomePage

    end

    class User
      def initialize(subject, exception = nil)
        @subject = subject
        @exception = exception
      end

      let(:email) { @subject.email }
      let(:email_error) {
        return nil if @exception.nil?
        @exception.errors[:email]
      }

      let(:password_error) {
        return nil if @exception.nil?
        @exception.errors[:password]
      }
    end

    class UserList
      takes :subject
      let(:all) { @subject }
    end
  end
end
