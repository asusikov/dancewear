class Category < ActiveRecord::Base

  attr_accessible :title

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :section
  has_many :goods

  validates :title, :presence => true
  
end
