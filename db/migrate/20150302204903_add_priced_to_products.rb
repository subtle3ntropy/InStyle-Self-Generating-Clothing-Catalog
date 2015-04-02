class AddPricedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :priced, :float
  end
end
