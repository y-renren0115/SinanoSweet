class Customer::CustomersController < ApplicationController
  before_action :authenticate_end_user!
  layout 'customer'
    
  def show
  end
  
  def edit
  end
  
  def update
  end
end
