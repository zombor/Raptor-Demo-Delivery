$LOAD_PATH << 'lib'
require './app'
require 'ostruct'

map "/assets" do
  run Rack::File.new("assets")
end

Arden::Repository.add(:user => Repository::User.new)

sessioned = Rack::Session::Pool.new(MyKissList::App,
                                    :domain => 'localhost',
                                    :expire_after => 2592000
                                   )
run sessioned
