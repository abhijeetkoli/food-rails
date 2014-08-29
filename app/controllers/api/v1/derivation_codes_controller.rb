class Api::V1::DerivationCodesController < Api::V1::ApplicationController
  	before_filter :authenticate_user!
  	skip_before_filter :verify_authenticity_token,
             :if => Proc.new { |c| c.request.format == 'application/json' }
	
	def index
    	@derivation_codes = DerivationCode.all
	end

	def show
		@derivation_code = DerivationCode.find(params[:id])
	end

end
