class AddAvatarToGood < ActiveRecord::Migration
  def self.up
    add_attachment :goods, :avatar
  end

  def self.down
    remove_attachment :goods, :avatar
  end
end
