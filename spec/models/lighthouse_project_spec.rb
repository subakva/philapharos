require 'spec_helper'

describe LighthouseProject do
  before(:each) do
    # @valid_attributes = {
    #   :name => "value for name",
    #   :lighthouse_id => 1
    # }
  end

  it "should create a new instance given valid attributes" do
    # LighthouseProject.create!(@valid_attributes)
  end
end

# == Schema Information
#
# Table name: lighthouse_projects
#
#  id                    :integer         not null, primary key
#  name                  :string(255)
#  lighthouse_id         :integer
#  lighthouse_account_id :integer
#  created_at            :datetime
#  updated_at            :datetime
#

