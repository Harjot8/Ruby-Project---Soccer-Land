class ProductController < ApplicationController
	before_action :load_favourite_product, except: :save_favourite_product

	def index 
		@categories = Category.all
		@pages = Page.all
		@products = Product.order("name").page(params[:page]).per(6)
		@category = Category.all

		if session[:visit_count]
			@visit_count = session[:visit_count] + 1
		else 
			@visit_count = 1
		end

		session[:visit_count] = @visit_count
	end 


	def category_search_results
		@pages = Page.all
		@categories = Category.all
		wildcard_keywords = '%' + params[:search_keywords] + '%'
		@products = Product.where("category_id = ? AND name LIKE ? OR description LIKE ?", params[:my_option], wildcard_keywords, wildcard_keywords).page(params[:page]).per(6)
	end 

	def show
		@categories = Category.all
		@pages = Page.all
		@product = Product.find(params[:id])
	end

	def search_results
		@categories = Category.all
		@pages = Page.all
		#need to make an variable otherwise easy to be hacked
		wildcard_keywords = '%' + params[:search_keywords] + '%'
			
		#SQL Statement using wildcard
		@products = Product.where("name LIKE ? OR description LIKE ?", wildcard_keywords, wildcard_keywords).order("name").page(params[:page]).per(6)
	end 
	#view: app/views/store/search_result.html.erb

	def save_favourite_product
		@categories = Category.all
		session[:favourite_product_id] = params[:id].to_i
		redirect_to :back
	end 

	private
	def load_favourite_product
		@categories = Category.all
		if session[:favourite_product_id]
			@favourite_product = Product.find(session[:favourite_product_id])
		else 
			@favourite_product = false
		end 
	end 
end
