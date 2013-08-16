# -*- encoding : utf-8 -*-
class Admin::GoodsController < Admin::AdminController

  before_filter :authenticate_user!
	layout 'admin'

  model Good do |m|
    m.redirect_path { |routes| routes.admin_goods_path }
    m.redirect_item_path { |routes, item| routes.admin_section_category_good_path item.category.section, item.category, item }
    m.new_model { |params| Category.find(params[:category_id]).goods }
  end

  def index
  	@sections = Section.all
    section_id = params[:section_id]
    category_id = params[:category_id]
    @current_section = Section.find(section_id) unless section_id.nil?
  	@current_category = Category.find(category_id) unless category_id.nil?
  	@goods = Good.by_catalog_item(:section_id => section_id, :category_id => category_id).paginate(:page => params[:page], :per_page => 20)
  end

end
