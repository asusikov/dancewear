class Post < ActiveRecord::Base

  attr_accessible :title, :body, :announcement, :avatar

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :presence => true
  validates :announcement, :presence => true

  has_attached_file :avatar, :styles => { :thumb => '100x100#' }, :default_url => "default_post_avatar.png"
  
end
