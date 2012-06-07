require 'spec_helper'
require 'repository'

describe Repository do
  let(:user_repo) { double('user repo') }

  before :each do
    Repository.add(:users => user_repo)
  end

  it 'adds a specific repository' do
    Repository.instance_variable_get(:@repositories).should == {:users => user_repo}
  end

  it 'retreives a specific repository' do
    Repository.for(:users).should == user_repo
  end
end
