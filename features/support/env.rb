require 'raptor'
require 'arden'
require 'repository/datamapper/user'
require 'capybara/cucumber'
require_relative '../../app'

Arden::Repository.add(:user => Repository::User.new)
Capybara.app = MyKissList::App
