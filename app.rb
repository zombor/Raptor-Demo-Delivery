$LOAD_PATH << 'lib'
require 'raptor'
require 'arden'
require_relative 'users'
require 'models/list'
require 'repository/datamapper/user'
require 'repository/datamapper/list'
require 'delegator/user'
require 'presenter/session'
require 'delegator/session'

module MyKissList
  App = Raptor::App.new(self) do
    root :render => "root", :present => :home_page
    path "user" do
      index :to => 'Repository::User.all'
      new
      create :to => 'MyKissList::Delegator::User.create', :redirect => :index, Error::Validation => :new
    end

    path 'session' do
      new :to => nil
      create :to => 'MyKissList::Delegator::Session.create', :redirect => '/', Error::Validation => :new
    end
  end
end

module MyKissList
  module Injectables
    class CreateUser
      def sources(injector)
        {:user => lambda { MyKissList::Records::User.new } }
      end
    end
  end
end
