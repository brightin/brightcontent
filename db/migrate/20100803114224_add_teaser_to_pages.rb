class AddTeaserToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :teaser, :text
  end

  def self.down
    remove_column :pages, :teaser
  end
end
