class GeaketAddColumnSpecial < ActiveRecord::Migration
  def self.up
    add_column :geakets, :special, :boolean
  end

  def self.down
    remove_column :geakets, :special, :boolean
  end
end
