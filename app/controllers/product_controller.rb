class ProductController < ApplicationController
	def index 
		@products = Product.all
	end 

	def show
		@product = Product.find(params[:id])
	end

	def search_results
		#need to make an variable otherwise easy to be hacked
		wildcard_keywords = '%' + params[:search_keywords] + '%'
			
		#SQL Statement using wildcard
		@products = Product.where("name LIKE ?", wildcard_keywords)
	end 
	#view: app/views/store/search_result.html.erb
end
