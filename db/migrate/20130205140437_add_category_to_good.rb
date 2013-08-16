class AddCategoryToGood < ActiveRecord::Migration
  def change
    add_column :goods, :category_id, :integer
    change_column :goods, :category_id, :integer, :null => false
  end
end
