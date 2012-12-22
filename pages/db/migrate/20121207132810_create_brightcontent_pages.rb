class CreateBrightcontentPages < ActiveRecord::Migration
  def change
    create_table :brightcontent_pages do |t|
      t.string :name
      t.text :body
      t.string :slug
      t.integer :depth
      t.integer :lft
      t.integer :rgt
      t.integer :parent_id

      t.timestamps
    end
    add_index :brightcontent_pages, :slug
  end
end
