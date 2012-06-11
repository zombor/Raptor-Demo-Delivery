module MyKissList
  module Presenters
    class Session
      def initialize(params, exception = nil)
        @params = params
        @exception = exception
      end

      let(:email) { @params[:email] }
      let(:email_error) {
        return nil if @exception.nil?
        @exception.errors[:email]
      }

      let(:password_error) {
        return nil if @exception.nil?
        @exception.errors[:password]
      }
    end
  end
end
