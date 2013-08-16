class AddDescriptionToGood < ActiveRecord::Migration
  def change
    add_column :goods, :description, :text
  end
end
