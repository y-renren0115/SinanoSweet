class Admin::CustomersController < ApplicationController
    layout 'admin'
    
    def index
      @customers = EndUser.page(params[:page])
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    end
end

