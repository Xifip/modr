class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validate :validate_emaildomain

  private 
  
  def validate_emaildomain
    emaildomain = self.email.split('@')[1]
    valid = false
    valid = true if emaildomain == 'resmed.com'        
    errors.add(:email, 'This is not a valid email domain, please user an email with: @resmed.com' ) unless valid       
  end

end
