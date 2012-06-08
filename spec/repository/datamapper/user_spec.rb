require 'spec_helper'
require 'repository/datamapper/user'

describe Repository::User do
  subject { Repository::User }

  before :all do
    subject.new.setup

    subject.create(MyKissList::Records::User.new(:email => 'foo@bar.com', :password => 'foobar'))
  end

  it 'stores a user in the database' do
    user = double('user', :id => 1, :email => '', :password => '')
    user.should_receive(:save)
    Repository::User::User.should_receive(:new).and_return(user)
    subject.create(double(:email => 'foo@bar.com', :password => 'foobar'))
  end

  it 'finds by id' do
    user = subject.find_by_id(1)

    user.class.should == MyKissList::Records::User
    user.email.should == 'foo@bar.com'
    user.password.should == 'foobar'
  end

  it 'returns all users' do
    Repository::User::User.should_receive(:all)
    subject.all
  end
end
