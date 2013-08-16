# -*- encoding : utf-8 -*-
class Admin::CategoriesController < Admin::AdminController

	before_filter :authenticate_user!

	layout 'admin'

	model Category do |m|
		m.redirect_path { |routes| routes.admin_categories_path }
		m.redirect_item_path { |routes, item| routes.admin_section_category_path item.section, item }
		m.new_model { |params| Section.find(params[:section_id]).categories }
	end

	def index
		@sections = Section.all
		condition = {}
		@current_section = nil
		@current_section = Section.find(params[:section_id]) if params[:section_id]
		condition[:section_id] = @current_section.id if @current_section
		@categories = Category.where(condition).order('created_at desc')
	end

end
