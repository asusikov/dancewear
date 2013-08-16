# -*- encoding : utf-8 -*-
class Admin::AdminController < ApplicationController

	def show
  	find_item params
  	set_header
  end

  def new
  	new_model = get_model.get_new_model params
		@item = new_model.new
  	set_header
  end

  def edit
  	find_item params
    set_header
  end

  def create
  	new_model = get_model.get_new_model params
  	@item = new_model.create params[get_model.params_name]
		set_header
  	check_errors @item, :new
  end

  def update
  	find_item params
    set_header
  	@item.update_attributes(params[get_model.params_name])
    check_errors @item, :edit
  end

  def destroy
    find_item params
    @item.destroy()
    flash[:success] = t('model.delete_success')
    redirect_to get_model.get_redirect_path
  end

  protected

	  class ControllerModel
	  	attr_accessor :model
	  	def initialize(model)
	  		self.model = model
	  	end

	  	def redirect_path(&code)
	  		@redirect_path = code
	  	end
	  	def get_redirect_path
	  		@redirect_path.call Rails.application.routes.url_helpers
	  	end

	  	def redirect_item_path(&code)
	  		@redirect_item_path = code
	  	end
	  	def get_redirect_item_path(item)
	  		@redirect_item_path.call Rails.application.routes.url_helpers, item
	  	end

	  	def new_model(&code)
	  		@new_model = code
	  	end
	  	def get_new_model(params)
	  		if @new_model
	  			@new_model.call params
	  		else
	  			model
	  		end
	  	end

	  	def params_name
	  		model.model_name.underscore
	  	end
	  end

	  class << self
		  def model(model)
		  	@model = ControllerModel.new model
		  	yield @model
		  end
		  def get_model
		  	@model
		  end
		end

		def get_model
	  	self.class.get_model
	  end

	  def find_item(params)
	  	@item = get_model.model.find params[:id]
	  end

	  def set_header
	  	if @item.new_record?
	  		@header = "#{get_model.model.model_name.human}: #{t('model.new')}"
	  	else
	  		@header = "#{get_model.model.model_name.human}: #{@item.title}"
	  	end
	  end

	  def check_errors(item, action)
	    if item.errors.blank?
	      flash[:success] = t('model.save_success')
	      redirect_to get_model.get_redirect_item_path(item)
	    else
	      flash.now[:error] = t('model.save_error')
	      render :action => action
	    end
	  end

end