class Product < ActiveRecord::Base
	belongs_to :category
	
	validates :name, :description, :stock_quantity, :price, presence: true
	validates :name, uniqueness: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}

	def favourite_product?(session)
		session[:favourite_product_id] == self.id
	end 	
end
