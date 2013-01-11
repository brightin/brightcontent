class AddDefaultHiddenToPages < ActiveRecord::Migration
  def change
    change_column :brightcontent_pages, :hidden, :boolean, default: false, null: false
  end
end
