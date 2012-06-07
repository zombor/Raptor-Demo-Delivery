require 'spec_helper'
require 'repository/datamapper'

describe Repository::DataMapper do
  it 'sets a datamapper repository' do
    DataMapper.should_receive(:setup).with(:default, 'sqlite::memory:')
    Repository::DataMapper.new.setup
  end
end
