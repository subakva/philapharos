class LighthouseProject < ActiveRecord::Base
  belongs_to :lighthouse_account

  validates_presence_of :name
  validates_presence_of :lighthouse_acccount_id
  validates_presence_of :lighthouse_id
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

