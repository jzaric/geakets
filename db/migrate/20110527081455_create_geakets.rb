class CreateGeakets < ActiveRecord::Migration
  def self.up
    create_table :geakets do |t|
      t.string :title
      t.string :content
      t.integer :view_count

      t.timestamps
    end
  end

  def self.down
    drop_table :geakets
  end
end
