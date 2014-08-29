class Weight < ActiveRecord::Base
  self.primary_key = :id
  
  belongs_to :food
end
