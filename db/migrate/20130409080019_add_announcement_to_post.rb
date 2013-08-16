class AddAnnouncementToPost < ActiveRecord::Migration
  def change
    add_column :posts, :announcement, :text
  end
end
