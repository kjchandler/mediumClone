class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_profile_exists

  protected

  def check_profile_exists
  	if user_signed_in? && !current_user.profile
  		redirect_to new_profile_path
  	end
  	
  end

end
