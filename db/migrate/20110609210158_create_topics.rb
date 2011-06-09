class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.integer :user_id
      t.string :title
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
