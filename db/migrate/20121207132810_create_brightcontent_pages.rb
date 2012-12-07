class CreateBrightcontentPages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :body
      t.string :slug

      t.timestamps
    end
    add_index :pages, :slug
  end
end
