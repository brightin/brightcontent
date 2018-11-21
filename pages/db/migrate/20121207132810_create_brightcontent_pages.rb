class CreateBrightcontentPages < ActiveRecord::Migration[4.2]
  def change
    create_table :brightcontent_pages do |t|
      t.string :name
      t.text :body
      t.string :slug
      t.integer :depth
      t.integer :lft
      t.integer :rgt
      t.integer :parent_id
      t.boolean :hidden, default: false, null: false

      t.timestamps
    end

    add_index :brightcontent_pages, :slug
  end

  def down
    drop_table :brightcontent_pages
  end
end
