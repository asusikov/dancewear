# -*- encoding : utf-8 -*-
module Admin::AdminHelper

	def add_button(url)
		icon_button :plus, url, t('form.add'), :info
	end

	def edit_small_button(url)
		edit_link url
	end

	def edit_button(url)
		edit_link url, t('form.edit'), :info
	end

	def delete_button(url, title)
		delete_link url, title, t('form.delete'), :danger
	end

	def delete_small_button(url, title)
		delete_link url, title
	end

	def save_button
		content_tag :button, icon_label(:ok, t('form.save')), :class => 'btn btn-success', :type => 'submit'
	end

	def cancel_button(url)
		icon_button :remove, url, t('form.cancel'), :warning
	end

	def show_form(item)
		content_tag :div, :class => 'show-form' do
			yield ShowForm.new(item)
		end
	end

	private

		class ShowForm
			include ActionView::Helpers::TagHelper
			include ActionView::Context  
			include ActionView::Helpers::TextHelper

			def initialize(item)
				@item = item
			end

			def custom_value(field_name, &code)
				custom field_name do |item|
					next @item.class.human_attribute_name(field_name), code.call(item)
				end
			end

			def text(field_name)
				custom field_name do |item| 
					next @item.class.human_attribute_name(field_name), item.send(field_name)
				end
			end

			private

				def custom(field_name, &code)
					label, value = code.call(@item)
					label = '' if label.nil?
					value = '' if value.nil?
					content_tag :div, :class => 'row-fluid' do
						concat content_tag(:div, label.html_safe, :class => 'span2 label-value')
						concat content_tag(:div, value.html_safe, :class => 'span10')
					end
				end 

		end

		def icon_label(icon, label = nil)
			icon_html = content_tag(:i, nil, :class => "icon-#{icon}")
			output = icon_html 
			output += ' ' + label if label
			output.html_safe
		end

		def button_class(btn_style = nil)
			btn_class = 'btn'
			btn_class += " btn-#{btn_style}" if btn_style
			btn_class
		end

		def icon_link(icon, url, label, style = nil)
			link_to icon_label(icon, label), url, :class => style
		end

		def icon_button(icon, url, label, btn_style = nil)
			btn_class = button_class btn_style
			icon_link icon, url, label, btn_class
		end

		def edit_link(url, label = nil, btn_style = nil)
			btn_class = button_class(btn_style) if btn_style
			icon_link :pencil, url, label, btn_class
		end

		def delete_link(url, title, label = nil, btn_style = nil)
			btn_class = button_class(btn_style) if btn_style
			link_to icon_label(:trash, label), url, :class => btn_class,
				:method => :delete,
				:confirm => t('form.confirm_text', :title => title), 
				"data-confirm-title" => t('form.confirm_delete')
		end

end