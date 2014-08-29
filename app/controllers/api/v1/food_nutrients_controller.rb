class Api::V1::FoodNutrientsController < Api::V1::ApplicationController
  	before_filter :authenticate_user!
  	skip_before_filter :verify_authenticity_token,
             :if => Proc.new { |c| c.request.format == 'application/json' }
	
	def index
    	@food_nutrients = FoodNutrient.all
	end

	def show
		@food_nutrient = FoodNutrient.find(params[:id])
	end

end
