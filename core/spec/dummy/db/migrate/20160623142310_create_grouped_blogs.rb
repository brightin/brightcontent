class CreateGroupedBlogs < ActiveRecord::Migration[4.2]
  def change
    create_table :grouped_blogs do |t|
      t.string :name
      t.text :body
      t.boolean :active, default: true
      t.column :author_id, :integer

      t.timestamps
    end
  end
end
