class Api::V1::NutrientsController < Api::V1::ApplicationController
  	before_filter :authenticate_user!
  	skip_before_filter :verify_authenticity_token,
             :if => Proc.new { |c| c.request.format == 'application/json' }
	
	def index
    	@nutrients = Nutrient.all
	end

	def show
		@nutrient = Nutrient.find(params[:id])
	end

end
