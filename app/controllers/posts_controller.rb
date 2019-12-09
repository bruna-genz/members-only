class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  
  def new
    @post = Post.new
  end

  def create
  end

  def index
  end

  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "You must log in"
        redirect_to sessions_new_path
      end
    end
end
