class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes, :id => false do |t|
      t.integer :user_id
      t.integer :geaket_id
    end
  end

  def self.down
    drop_table :votes
  end
end
