class Api::V1::FoodDataSourcesController < Api::V1::ApplicationController
  	before_filter :authenticate_user!
  	skip_before_filter :verify_authenticity_token,
             :if => Proc.new { |c| c.request.format == 'application/json' }
	
	def index
    	@food_data_sources = FoodDataSource.all
	end

	def show
		@food_data_source = FoodDataSource.find(params[:id])
	end

end
