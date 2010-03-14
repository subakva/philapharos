class LighthouseAccount < ActiveRecord::Base
  has_many :lighthouse_projects
  validates_presence_of :account_name
  validates_presence_of :token

  def fetch_project(project_id)
    Lighthouse.account = self.account_name
    Lighthouse.token = self.token

    Lighthouse::Project.find(project_id)
  end

  def fetch_projects
    Lighthouse.account = self.account_name
    Lighthouse.token = self.token

    Lighthouse::Project.find(:all)
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

