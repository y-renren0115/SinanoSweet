class Customer::AddressesController < ApplicationController
  
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    if @address.save
      redirect_to customer_addresses_path
    else
      flash[:notice] = "入力に誤りがあります"
      @addresses = Address.all
      render action: :index
    end
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to customer_addresses_path
    else
      render action: :edit
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to customer_addresses_path
  end
  
  private
  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end
end
