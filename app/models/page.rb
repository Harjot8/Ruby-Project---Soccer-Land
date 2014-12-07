class Page < ActiveRecord::Base
	validates :name, :description, presence: true
	validates :name, uniqueness: true

	def slug 
		"tes"
	end 
end
