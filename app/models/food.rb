class Food < ActiveRecord::Base
  self.primary_key = :id

  belongs_to :food_group
  has_many :food_nutrients
  has_many :food_data_sources
  has_many :weights
  has_many :nutrients, :through => :food_nutrients

  accepts_nested_attributes_for :nutrients, :food_nutrients, :food_data_sources, :weights
end
