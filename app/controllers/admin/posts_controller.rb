# -*- encoding : utf-8 -*-
class Admin::PostsController < Admin::AdminController

  before_filter :authenticate_user!
  
  layout 'admin'

  model Post do |m|
    m.redirect_path { |routes| routes.admin_posts_path }
    m.redirect_item_path { |routes, item| routes.admin_post_path item }
  end

  def index
  	@posts = Post.order("created_at desc").page(params[:page])
  end

end
