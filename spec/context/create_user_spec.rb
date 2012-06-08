require 'spec_helper'
require 'context/create_user'

describe MyKissList::Context::CreateUser do
  subject { MyKissList::Context::CreateUser }
  it 'creates a user' do
    Arden::Repository.for(:user).should_receive(:create)
    user = MyKissList::Records::User.new(:email => 'foo@bar.com', :password => 'foobar')
    subject.new(user).execute
  end
end
