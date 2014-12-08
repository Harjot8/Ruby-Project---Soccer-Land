class ProductController < ApplicationController
	before_action :load_favourite_product, except: :save_favourite_product

	def index 
		@pages = Page.all
		@products = Product.all
		@category = Category.all

		if session[:visit_count]
			@visit_count = session[:visit_count] + 1
		else 
			@visit_count = 1
		end

		session[:visit_count] = @visit_count
	end 

	def show
		@pages = Page.all
		@product = Product.find(params[:id])
	end

	def search_results
		@pages = Page.all
		#need to make an variable otherwise easy to be hacked
		wildcard_keywords = '%' + params[:search_keywords] + '%'
			
		#SQL Statement using wildcard
		@products = Product.where("name LIKE ?", wildcard_keywords)
	end 
	#view: app/views/store/search_result.html.erb

	def save_favourite_product
		session[:favourite_product_id] = params[:id].to_i
		redirect_to :back
	end 

	private
	def load_favourite_product
		if session[:favourite_product_id]
			@favourite_product = Product.find(session[:favourite_product_id])
		else 
			@favourite_product = false
		end 
	end 
end
