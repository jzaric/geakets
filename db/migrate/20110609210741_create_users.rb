class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :nick_name
      t.string :email
      t.string :thumb_url

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
