class PageController < ApplicationController

	def show
		@pages = Page.all
		page_id = params[:id]
		@page = Page.find(page_id)
	end
	#The associated view will load: app/views/pages/show.html.erb
end
