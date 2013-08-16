class Section < ActiveRecord::Base

  attr_accessible :title

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :categories
  
  validates :title, :presence => true

end
