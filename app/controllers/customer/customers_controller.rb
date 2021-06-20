class Customer::CustomersController < ApplicationController
  before_action :authenticate_end_user!
  layout 'customer'
    
  def show
    @customer = current_end_user
    @customer_name = current_end_user.last_name + current_end_user.first_name
    @customer_name_kana = current_end_user.last_name_kana + current_end_user.first_name_kana
  end
  
  def edit
    @customer = EndUser.find_by(id: current_end_user.id)
  end
  
  def update
    @customer = EndUser.find_by(id: current_end_user.id)
    if @customer.update(customer_params)
      redirect_to customer_customers_path
    else
      render edit_customer_customers_path
    end
  end
  
  def confirm
  end
  
  def withdrawal
    @customer = EndUser.find(current_end_user.id)
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "ありがとうございました！またのご利用心からお待ちしております！"
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :postcode, :address)
  end
end
