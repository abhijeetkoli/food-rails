class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_api_key!
  
  before_filter :update_sanitized_params, if: :devise_controller?
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }                     

  respond_to :json
  

  def create
    registration_params = params[:registration]
    user_params = registration_params[:user]
  
    build_resource
    resource = User.new(user_params.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation))
    resource.skip_confirmation!
    if resource.save
      sign_in resource
      render :status => 200,
           :json => { :success => true,
                      :info => "Registered",
                      :data => { :user => resource,                                 
                                 :auth_token => current_user.authentication_token } }
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => resource.errors,
                        :data => {} }
    end
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password)}
  end
 
  private

  def authenticate_api_key!
    Rails.logger.debug("authenticate_api_key")
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

end