class CreateLighthouseProjects < ActiveRecord::Migration
  def self.up
    create_table :lighthouse_projects do |t|
      t.string :name
      t.integer :lighthouse_id
      t.integer :lighthouse_account_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lighthouse_projects
  end
end
