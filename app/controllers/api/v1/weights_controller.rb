class Api::V1::WeightsController < Api::V1::ApplicationController
  	before_filter :authenticate_user!
  	skip_before_filter :verify_authenticity_token,
             :if => Proc.new { |c| c.request.format == 'application/json' }
	
	def index
    	@weights = Weight.all
	end

	def show
		@weight = Weight.find(params[:id])
	end

end
