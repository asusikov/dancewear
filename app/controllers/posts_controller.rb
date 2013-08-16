class PostsController < ApplicationController

  def index
  	@posts = Post.order("created_at desc").page(params[:page])
  end

  def show
  	@item = Post.find(params[:id])
  end

end
