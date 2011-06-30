class CreateIssueFormats < ActiveRecord::Migration
  def self.up
    create_table :issue_formats do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :issue_formats
  end
end
