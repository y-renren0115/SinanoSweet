class Customer::CartItemsController < ApplicationController
    before_action :authenticate_end_user!
    layout 'customer'
    
    def index
    end
    
    def update
    end
    
    def create
    end
end
