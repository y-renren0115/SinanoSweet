class Admin::CustomersController < ApplicationController
    layout 'admin'
    
    def index
      @customers = EndUser.page(params[:page]).per(10).reverse_order
    end
    
    def show
      @customer = EndUser.find(params[:id])
    end
    
    def edit
    end
    
    def update
    end
end

