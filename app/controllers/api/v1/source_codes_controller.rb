class Api::V1::SourceCodesController < Api::V1::ApplicationController
  	before_filter :authenticate_user!
  	skip_before_filter :verify_authenticity_token,
             :if => Proc.new { |c| c.request.format == 'application/json' }
	
	def index
    	@source_codes = SourceCode.all
	end

	def show
		@source_code = SourceCode.find(params[:id])
	end

end
