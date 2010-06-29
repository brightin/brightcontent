class AddParentIdToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :parent_id, :string
  end

  def self.down
    remove_column :pages, :parent_id
  end
end
