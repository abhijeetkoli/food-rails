class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  before_save :ensure_authentication_token

  def ensure_authentication_token
    Rails.logger.debug("ensure authentication token")
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
      Rails.logger.debug("generate_authentication_token: #{self.authentication_token}")
      self.authentication_token
    end
  end

   def skip_confirmation!
     self.confirmed_at = Time.now
  end

  def set_type
    #raise "You must override this method in each model inheriting from User!"
  end
 
  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
