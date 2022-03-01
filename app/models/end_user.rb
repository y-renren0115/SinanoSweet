class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cart_items
  has_many :orders
  has_many :addresses
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :phone_number, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  
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
