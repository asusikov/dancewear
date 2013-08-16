class GoodsController < ApplicationController

  def show
    @item = Good.find(params[:id])
  end

  def index
  	@sections = Section.all
  	@current_section_id = Section.find(params[:section]).id unless params[:section].nil?
  	@current_category_id = Category.find(params[:category]).id unless params[:category].nil?
  	@goods = Good.by_catalog_item(:section_id => @current_section_id, :category_id => @current_category_id).page(params[:page])
  end

end
