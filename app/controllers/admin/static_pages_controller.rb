# -*- encoding : utf-8 -*-
class Admin::StaticPagesController < Admin::AdminController

	before_filter :authenticate_user!
	layout 'admin'

	model StaticPage do |m|
		m.redirect_item_path { |routes, item| routes.admin_static_page_path item }
	end

  def index
  	@items = StaticPage.order('created_at desc')
  end

end
