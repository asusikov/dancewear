class StaticPagesController < ApplicationController

  def show
  	@item = StaticPage.find(params[:id])
  end

end
