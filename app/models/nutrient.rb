class Nutrient < ActiveRecord::Base
	self.primary_key = :id
	
	default_scope { order('id DESC') }
end
