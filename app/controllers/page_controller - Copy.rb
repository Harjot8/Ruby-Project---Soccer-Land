class PageController < ApplicationController

	def show
		@pages = Page.all
		page_id = params[:id]
		@page = Page.find(page_id)
	end
	#The associated view will load: app/views/pages/show.html.erb

	def login
		@pages = Page.all
		@customer = Customer.first
	end 

	def register
		@pages = Page.all
		@customer = Customer.new
	end 
end
