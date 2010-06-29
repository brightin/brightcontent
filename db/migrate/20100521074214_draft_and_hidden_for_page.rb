class DraftAndHiddenForPage < ActiveRecord::Migration
  def self.up
  	change_table :pages do |t|
  		t.remove :published
  		t.remove :visible
  		t.column :hidden, :boolean
  		t.column :draft, :boolean
  	end
  end

  def self.down
  	change_table :pages do |t|
  		t.column :published, :boolean
  		t.column :visible, :boolean
  		t.remove :hidden
  		t.remove :draft
  	end
  end
end
