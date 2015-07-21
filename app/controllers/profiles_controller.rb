class ProfilesController < ApplicationController
  skip_before_action :check_profile_exists, :only => [:new, :create]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
  	redirect_to current_user.profile
  end

  def new
  	@profile = Profile.new
  end

  def edit
  	
  end

  def show
  	@posts = @profile.user.posts
  end

  def create
  	@profile = Profile.new(profile_params)
  	@profile.user_id = current_user.id
  	
  	respond_to do |format|
  		if @profile.save
  			format.html { redirect_to profiles_path, notice: 'Profile was created'}
  		else
  			format.html { render: new}
  		end
  end
end

def update
	respond_to do |format|
		if @profile.update(profile_params)
			format.html { redirect_to profiles_path, notice: 'Profile was updated'}
		else
			format.html { render :edit}
		end
	end
end

private
	def set_profile
		@profile = Profile.find(params[:id])
	end

	def profile_params
		params.require(:profile).permit(:username, :avatar)
		
	end
end















