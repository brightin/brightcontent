class DisableNullsInPageBooleans < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.remove :hidden
      t.boolean :hidden, :null => false, :default => false
      t.remove :draft
      t.boolean :draft, :null => false, :default => false
    end
  end

  def self.down
    change_table :pages do |t|
      t.remove :hidden
      t.boolean :hidden, :null => true
      t.remove :draft
      t.boolean :draft, :null => true
    end
  end
end
