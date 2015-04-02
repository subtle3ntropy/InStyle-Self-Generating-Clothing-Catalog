class ChangeDataTypeForProducts < ActiveRecord::Migration
  def change
   def self.up
    change_table :products do |t|
      t.change :price, :decimal, :precision => 2, :scale => 1
    end
  end

  def self.down
    change_table :products do |t|
      t.change :price, :decimal
    end
  end
end
end