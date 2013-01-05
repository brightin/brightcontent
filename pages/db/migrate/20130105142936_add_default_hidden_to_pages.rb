class AddDefaultHiddenToPages < ActiveRecord::Migration
  def change
    change_column :brightcontent_pages, :hidden, :boolean, default: true, null: false
  end
end
