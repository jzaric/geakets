class ChangeGeaketContentType < ActiveRecord::Migration
  def self.up
    change_column :geakets, :content, :text
  end

  def self.down
    change_column :geakets, :content, :string
  end
end
