class Customer < ActiveRecord::Base
	validates :username, :first, :last, :email, presence: true
	validates :username, uniqueness: true
end
