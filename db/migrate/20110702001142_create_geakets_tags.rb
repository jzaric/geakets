class CreateGeaketsTags < ActiveRecord::Migration
  def self.up
    create_table :geakets_tags, :id => false do |t|
      t.integer :geaket_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :geakets_tags
  end
end
