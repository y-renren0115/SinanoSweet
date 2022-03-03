# frozen_string_literal: true

class EndUsers::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   # super
  #   @customer_pass = EndUser.find_by(id: current_end_user.id)
  # end

  # PUT /resource/password
  # def update
  #   # super
  #   @customer_pass = EndUser.find_by(id: current_end_user.id)
  #   if @customer_pass.update(password_params)
  #     redirect_to customer_customers_path
  #   else
  #     render edit_end_user_password_path
  #   end
  # end

  # protected
  
  # def password_params
  #   params.require(:end_user).params(:encrypted_password)
  # end

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
