class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :section_id, :null => false
      t.timestamps
    end
  end
end
