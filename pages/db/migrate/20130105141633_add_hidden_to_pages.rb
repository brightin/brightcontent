class AddHiddenToPages < ActiveRecord::Migration
  def change
    add_column :brightcontent_pages, :hidden, :boolean
  end
end
