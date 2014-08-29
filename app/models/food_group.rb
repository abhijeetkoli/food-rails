class FoodGroup < ActiveRecord::Base
	self.primary_key = :id
	
	has_many :foods

	accepts_nested_attributes_for :foods
end
