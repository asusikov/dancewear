# -*- encoding : utf-8 -*-
class Admin::SectionsController < Admin::AdminController

  before_filter :authenticate_user!
  layout 'admin'
  model Section do |m|
    m.redirect_path { |routes| routes.admin_sections_path }
    m.redirect_item_path { |routes, item| routes.admin_section_path item }
  end

  def index
  	@items = Section.order('created_at desc')
  end

end
