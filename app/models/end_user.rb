class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def active_for_authentication?
    super && (self.is_active == true)
  end
  
  def revert_status
    if self.is_active == true
      return "有効"
    else
      return "退会済"
    end
  end
end
