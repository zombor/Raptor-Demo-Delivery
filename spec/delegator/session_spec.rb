require 'spec_helper'
require 'delegator/session'

# This is outside of this gem. I question if this should just be mocked.
require 'models/user'

describe MyKissList::Delegator::Session do
  subject { MyKissList::Delegator::Session }

  let(:user) { MyKissList::Records::User.new(:id => 1, :email => 'foo@bar.com', :password => 'foobar') }
  let(:rack_env) { double('env') }
  let(:session) {double('session') }

  it 'creates a session with valid data' do
    Arden::Repository.for(:user).should_receive(:find_by_email).and_return(user)
    session.should_receive('[]=').with(:user_id, user.id)
    rack_env.should_receive('[]').with('rack.session').and_return(session)

    subject.create({:email => 'foo@bar.com', :password => 'foobar'}, rack_env)
  end

  it 'raises a not found exception if the user is not found' do
    Arden::Repository.for(:user).should_receive(:find_by_email).and_return(nil)

    lambda { subject.create({'email' => 'foo@bar.com', 'password' => 'foobar'}, {}) }.should raise_error(Error::NotFound)
  end

  it 'raises a validation exception if the password does not match' do
    Arden::Repository.for(:user).should_receive(:find_by_email).and_return(user)

    lambda { subject.create({'email' => 'foo@bar.com', 'password' => 'fobar'}, {}) }.should raise_error(Error::Validation) { |error|
      error.errors.should have_key(:email)
    }
  end
end
