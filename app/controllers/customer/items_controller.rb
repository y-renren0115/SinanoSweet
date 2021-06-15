class Customer::ItemsController < ApplicationController
    before_action :authenticate_end_user!, except: :index
    layout 'customer'
    
    def index
    end
end
