class CreateLighthouseAccounts < ActiveRecord::Migration
  def self.up
    create_table :lighthouse_accounts do |t|
      t.string :account_name
      t.string :token

      t.timestamps
    end
  end

  def self.down
    drop_table :lighthouse_accounts
  end
end
