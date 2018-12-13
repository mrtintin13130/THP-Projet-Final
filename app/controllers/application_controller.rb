class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_username
	protected
	def configure_permitted_parameters
		attributes = [:first_name, :last_name, :email, :phone, :avatar, :city, :sex, :username]
		devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
		devise_parameter_sanitizer.permit(:account_update, keys: attributes)
	end
	def after_sign_in_path_for(resource)
		root_path
	end
	def set_username
		if current_user != nil && current_user.last_name != nil && current_user.first_name != nil
			@user_names = current_user.last_name + " " + current_user.first_name
		end
	end
end
