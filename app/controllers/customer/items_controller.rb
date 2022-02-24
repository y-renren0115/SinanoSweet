class Customer::ItemsController < ApplicationController
    before_action :authenticate_end_user!, except: :index
    layout 'customer'
    
    def index
      @items = Item.page(params[:page]).per(10)
    end
    
    def show
      @item = Item.find(params[:id])
      @cart_item = CartItem.new
    end
end
