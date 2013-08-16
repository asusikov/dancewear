class AddAnnouncementToGood < ActiveRecord::Migration
  def change
    add_column :goods, :announcement, :text
  end
end
