class FoodNutrient < ActiveRecord::Base
  self.primary_key = :id
  
  belongs_to :food
  belongs_to :nutrient
  has_many :source_codes
  has_many :derivation_codes

  accepts_nested_attributes_for :source_codes, :derivation_codes
end
