class FoodDataSource < ActiveRecord::Base
  self.primary_key = :id
  
  belongs_to :food
  belongs_to :nutrients
  belongs_to :data_sources

  accepts_nested_attributes_for :nutrients, :data_sources
end
