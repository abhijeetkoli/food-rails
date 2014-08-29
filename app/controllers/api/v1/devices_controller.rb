class Api::V1::DevicesController < Api::V1::ApplicationController
	
	skip_before_filter :verify_authenticity_token,
					   :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def index
    	@devices = current_user.devices
  	end

  	def show
    	@device = Device.find(params[:id])
  	end

	def create
    	@device = Device.new(user_id: current_user.id, company_id: current_user.co.id, token: device_params[:token], enabled: device_params[:enabled])

    	if @device.save      	
	      	@device
    	else
	      	render :status => :unprocessable_entity,
	               :json => { :success => false,
	                          :info => @device.errors,
	                          :data => {} }
	    end
	end

	private

  	def device_params
    	params.require(:device).permit(:token, :enabled)
  	end

end
