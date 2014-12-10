class PageController < ApplicationController

	def show
		@categories = Category.all
		@pages = Page.all
		page_id = params[:id]
		@page = Page.find(page_id)
	end
	#The associated view will load: app/views/pages/show.html.erb

	def login
		@categories = Category.all
		@pages = Page.all
		@customer = Customer.first
	end 

	def register
		@categories = Category.all
		@pages = Page.all
		@customer = Customer.new
	end 
end
