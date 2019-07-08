class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
      redirect_to root_path, notice: 'Post was created not successfully'
    end 
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params) 
      redirect_to @post, notice: 'Post was updated successfully'
    else
      render 'edit'
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
end
