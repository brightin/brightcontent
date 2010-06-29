class AddRoutedResourceToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :resource, :string 
  end

  def self.down
    remove_column :pages, :resource
  end
end
