class Admin::OrdersController < ApplicationController
    layout 'admin'
    
    def index
      @orders = Order.all
    end
    
    def show
      @order = Order.find(params[:id])
      @order_details = @order.order_details
    end
    
    def update
      @order = Order.find(params[:id])
      @order_details = @order.order_details
      if @order.update(order_params)
        if @order.order_status == "入金確認"
           @order_details.update_all(production_status: 1)
           redirect_to action: :show
        end
      else
        redirect_to action: :show
      end
    end
    
    private
    def order_params
      params.require(:order).permit(:end_user_id, :name, :postcode, :address, :pay_method, :shipping_fee, :total_billed_amount, :order_status)
    end
end
