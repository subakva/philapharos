require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../config/credentials')

describe LighthouseAccount do
  before(:each) do
    @valid_attributes = {
      :account_name => LH_ACCOUNT_NAME,
      :token => LH_TOKEN
    }
  end

  it "should create a new instance given valid attributes" do
    LighthouseAccount.create!(@valid_attributes)
  end

  it "should be able to fetch a list of projects for an account" do
    account = LighthouseAccount.create!(@valid_attributes)
    projects = account.fetch_projects
    projects.should_not be_nil
    projects.size.should == 1
    projects.first.name.should == 'The Bug Tracker'
  end

  it "should be able to fetch a single project for an account" do
    account = LighthouseAccount.create!(@valid_attributes)
    project = account.fetch_project('39540')
    project.should_not be_nil
    project.name.should == 'The Bug Tracker'
  end
end

# == Schema Information
#
# Table name: lighthouse_accounts
#
#  id           :integer         not null, primary key
#  account_name :string(255)
#  token        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

