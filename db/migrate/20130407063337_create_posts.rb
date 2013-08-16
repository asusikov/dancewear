class CreatePosts < ActiveRecord::Migration
  def change
  	drop_table :news
    create_table :posts do |t|
      t.string :title

      t.timestamps
    end
  end
end
