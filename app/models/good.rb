class Good < ActiveRecord::Base
	
  attr_accessible :title, :announcement, :price, :description, :avatar

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :category

  has_attached_file :avatar, :styles => { :full => '400x400#', :medium => '300x300#', :thumb => '150x150#' }, :default_url => "default_good_avatar_:style.png"

  scope :by_catalog_item, lambda { |args = {}| 
  	category_id = Category.find(args[:category_id]).id unless args[:category_id].nil?
  	section_id = Section.find(args[:section_id]).id unless args[:section_id].nil?
  	conditions = {}
  	if category_id then
  		conditions[:category_id] = category_id
  	elsif section_id then
  	 	conditions[:categories] = { :section_id => section_id }
  	end
  	joins(:category).where(conditions).order('goods.created_at desc')
  }

end
