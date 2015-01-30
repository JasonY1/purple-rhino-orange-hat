class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # # redirect user after login
  # def after_sign_in_path_for(resource)
    # unless current_user.profile.nil?
      # profiles_path 
    # else
      # flash[:alert] = "Please complete your profile"
      # new_profile_path
    # end
  # end
# 
  # # redirect after logout
  # def after_sign_out_path_for(resource_or_scope)
    # new_user_session_path
  # end
end
