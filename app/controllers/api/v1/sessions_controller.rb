class Api::V1::SessionsController < Devise::SessionsController
  before_filter :authenticate_api_key!
  before_filter :update_sanitized_params, if: :devise_controller?
  
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    current_user.ensure_authentication_token
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged in",
                      :data => { :auth_token => current_user.authentication_token, 
                                 :csrf_param => request_forgery_protection_token,
                                 :csrf_token => form_authenticity_token,
                                 :id => current_user.id,                              
                                 :first_name => current_user.first_name,
                                 :last_name => current_user.last_name} }
  end

  def destroy
    Rails.logger.debug("api session distroy")
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    current_user.update_column(:authentication_token, nil)
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end

  private

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:username, :email, :password, :password_confirmation)}    
  end

  def authenticate_api_key!
    Rails.logger.debug("authenticate_api_key")
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

end