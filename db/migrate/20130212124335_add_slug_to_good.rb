class AddSlugToGood < ActiveRecord::Migration
  def change
    add_column :goods, :slug, :string
    add_index :goods, :slug, unique: true
  end
end
