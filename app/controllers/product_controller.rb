class ProductController < ApplicationController
	def index 
		@products = Product.all
	end 

	def show
		@product = Product.first
	end
end
