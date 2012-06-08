require 'models/user'

module Repository
  class User < Arden::Repository::DataMapper

    def self.create(data)
      user = User.new(:email => data.email, :password => data.password)
      user.save

      MyKissList::Records::User.new(:id => user.id, :email => user.email, :password => user.password)
    end

    def self.find_by_id(id)
      self.convert_model(User.get(id))
    end

    def self.all
      User.all
    end

    protected

    def self.convert_model(model)
      MyKissList::Records::User.new(:id => model.id, :email => model.email, :password => model.password)
    end

    class User
      include ::DataMapper::Resource

      property :id,       Serial
      property :email,    String
      property :password, String
    end

  end
end
