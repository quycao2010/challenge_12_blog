class PostsController < ApplicationController
  before_action :check_login, only: [:edit, :update, :destroy, :new]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new   
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id]) 
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: 'Post was created successfully'
    else
      render :back
    end 
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params) 
      redirect_to @post, notice: 'Post was updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def check_login
    unless logged_in?
      redirect_to login_path
    end
  end
  
end
