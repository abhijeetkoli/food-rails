class Api::V1::FoodGroupsController < Api::V1::ApplicationController
  	before_filter :authenticate_user!
  	skip_before_filter :verify_authenticity_token,
             :if => Proc.new { |c| c.request.format == 'application/json' }
	
	def index
    	@food_groups = FoodGroup.all
	end

	def show
		@food_group = FoodGroup.find(params[:id])
	end

end
