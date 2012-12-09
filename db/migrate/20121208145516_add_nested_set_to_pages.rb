class AddNestedSetToPages < ActiveRecord::Migration
  def change
    add_column :pages, :depth, :integer
    add_column :pages, :lft, :integer
    add_column :pages, :rgt, :integer
    add_column :pages, :parent_id, :integer
  end
end
