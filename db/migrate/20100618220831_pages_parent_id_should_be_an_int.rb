class PagesParentIdShouldBeAnInt < ActiveRecord::Migration
  def self.up
    remove_column :pages, :parent_id
    add_column :pages, :parent_id, :int
  end

  def self.down
    remove_column :pages, :parent_id
    add_column :pages, :parent_id, :string
  end
end
