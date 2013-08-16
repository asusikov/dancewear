class AddPriceToGood < ActiveRecord::Migration
  def change
    add_column :goods, :price, :decimal, :precision => 8, :scale => 2
  end
end
