class ProductController < ApplicationController
	def index 
		@products = Product.all
		@category = Category.all
	end 

	def show
		@product = Product.find(params[:id])
	end
end
