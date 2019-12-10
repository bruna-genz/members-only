# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:success] = "Your post was created"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.paginate(page: params[:page], :per_page => 5)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'You must log in'
      redirect_to sessions_new_path
    end
  end
end
