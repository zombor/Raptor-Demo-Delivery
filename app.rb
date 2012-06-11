require 'raptor'
require 'arden'
require_relative 'users'
require 'models/list'
require 'repository/datamapper/user'
require 'repository/datamapper/list'
require 'delegator/create_user'

module MyKissList
  App = Raptor::App.new(self) do
    root :render => "root", :present => :home_page
    path "user" do
      index :to => 'Repository::User.all'
      new
      create :to => 'MyKissList::Delegator::CreateUser.execute', :redirect => :index, Error::Validation => :new
    end
  end
end

module MyKissList
  module Injectables
    class CreateUser
      def sources(injector)
        {:user => lambda { "tasty" } }
      end
    end
  end
end
