require 'repository'
require 'data_mapper'

module Repository
  class DataMapper
    def repo
      :default
    end

    def location
      'sqlite::memory:'
    end

    def setup
      ::DataMapper.setup(self.repo, self.location)
    end
  end
end
