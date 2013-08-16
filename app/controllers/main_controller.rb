class MainController < ApplicationController

  def index
  	@posts = Post.order("created_at desc").limit(8)
  	@goods = Good.order("created_at desc").limit(4)
  end

end
