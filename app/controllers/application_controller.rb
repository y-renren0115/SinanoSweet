class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
      case resource
      when EndUser
        customer_customers_path
      when Admin
        admin_customers_path
      end
    end
    
    def after_sign_out_path_for(resource)
      case resource
      when :end_user
        root_path
      when :admin
        new_admin_session_path
      end
      # if resource == :end_user
      #   root_path
      # else
      #   new_admin_session_path
      # end
    end
    
    protected
    # def after_update_path_for(resource)
    #   customer_customers_path
    # end
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :postcode, :address])
    end
end
