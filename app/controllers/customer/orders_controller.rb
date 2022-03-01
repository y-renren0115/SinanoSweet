class Customer::OrdersController < ApplicationController
  
  def index
    @orders = current_end_user.orders.page(params[:page]).per(10).reverse_order
  end
  
  def show
  end
  
  def new
    @order = Order.new
    @address = Address.new
    @cart_items = CartItem.all
  end
  
  def create
    @address_build = Address.create(end_user_id: current_end_user.id)
    @addresses = current_end_user.addresses
    @order = Order.new(end_user_id:session[:end_user_id], shipping_fee:session[:shipping_fee], total_billed_amount:params[:total_billed_amount], pay_method:session[:pay_method], postcode:session[:postcode], address:session[:address], name:session[:name])
    @order.save
    @address = Address.new(end_user_id:session[:end_user_id], name:session[:name], postcode:session[:postcode], address:session[:address])
    @addresses.each do |address|
      if address.name == session[:name] && address.postcode == session[:postcode] && address.address == session[:address]
        @address.destroy
      else
        @address.save
      end
      @address_build.destroy
    end
    cart_items = current_end_user.cart_items
    cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = (cart_item.item.price*1.08).floor
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
      current_end_user.cart_items.destroy_all
      redirect_to customer_orders_done_path
  end
  
  def order_confirm
    session[:end_user_id] = params[:order][:end_user_id]
    session[:shipping_fee] = params[:order][:shipping_fee]
    session[:pay_method] = params[:order][:pay_method]
    session[:address_option] = params[:order][:address_option]
    if session[:address_option] == "0"
      session[:postcode] = current_end_user.postcode
      session[:address] = current_end_user.address
      session[:name] = current_end_user.last_name + current_end_user.first_name
    elsif session[:address_option] == "1"
      order = Address.find(params[:order][:shipping_address_for_order])
      session[:name] = order.name
      session[:address] = order.address
      session[:postcode] = order.postcode
    elsif session[:address_option] == "2"
      session[:postcode] = params[:order][:postcode]
      session[:address] = params[:order][:address]
      session[:name] = params[:order][:name]
    end
    @order_cart_items = current_end_user.cart_items
    @order_detail = Order.find_by(end_user_id: current_end_user.id)
    @user_name = current_end_user.last_name + current_end_user.first_name
  end
  
  def order_done
  end
  
  private
  def order_params
    params.permit(:end_user_id, :name, :postcode, :address, :pay_method, :shipping_fee, :total_billed_amount, :order_status)
  end
end
