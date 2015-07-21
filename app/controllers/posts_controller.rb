class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  before_action :set_post, only: [:show, :destroy]
  before_action :require_auth, only: [:destroy]


  def new
  	@post = Post.new
  end

  def show
  	
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id

  	respond_to do |format|
  		if @post.save
  			format.html { redirect_to @post }
  		else
  			format.html { render :new}
  		end
  end
end

def destroy
	@post.destroy
	respond_to do |format|
		format.html { redirect_to '/', :notice => 'Post delete successful'}
	end
end

private

def require_auth
	if @post.user_id != current_user.id
		flash[:alert] ="You are not authorized"
		redirect_to :back
	end
end

def set_post
	@post = Post.find(params[:id])
	
end

def post_params
	params.require(:post).permit(:description, :picture)
end
end




















