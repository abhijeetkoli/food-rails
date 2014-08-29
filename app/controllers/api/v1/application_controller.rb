# We could make the authentication mechanism above a bit more safe
# by requiring a token **AND** an e-mail for token authentication.
# The code in the model looks the same, we just need to slightly
# change the controller:
class Api::V1::ApplicationController < ActionController::Base
  #API KEY authentication
  before_filter :authenticate_api_key!
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session
  # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!
  
  # This is Devise's authentication
  #before_filter :authenticate_user!
  
  Rails.logger.debug("api application controller")
  
  private
  
  def authenticate_user_from_token!
    user_email = params[:user_email].presence
    
    user = user_email && User.find_by_email(user_email)
    
    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:auth_token])
      Rails.logger.debug("token matched")
      sign_in user, store: false
    else
      Rails.logger.debug("token match failed")
      render_unauthorized
    end

  end

  def authenticate_api_key!
    Rails.logger.debug("authenticate_api_key")
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render :status => :unauthorized,
            :json => { :success => false,
                        :info => 'Bad credentials.',
                        :data => {} }
  end

end
