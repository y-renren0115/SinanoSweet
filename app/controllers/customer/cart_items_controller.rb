class Customer::CartItemsController < ApplicationController
    before_action :authenticate_end_user!
    layout 'customer'
    
    def index
        @cart_items = CartItem.page(params[:page]).per(10)
    end
    
    def create
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.end_user_id = current_end_user.id
      @cart_items = CartItem.all
      @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        update_amount = cart_item.amount + @cart_item.amount
        cart_item.update(amount: update_amount)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to customer_cart_items_path
    end
    
    def update
      @cart_item = CartItem.find(params[:id])
      if @cart_item.update(cart_item_params)
        flash[:notice] = "数量変更完了！"
        redirect_to customer_cart_items_path
      end
    end
    
    def destroy
      @cart_item = CartItem.find(params[:id])
      @cart_item.destroy
      redirect_to customer_cart_items_path
    end
    
    def destroy_all
      @cart_items = CartItem.all
      @cart_items.destroy_all
      redirect_to customer_cart_items_path
    end
    
    private
    def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
    end
end
