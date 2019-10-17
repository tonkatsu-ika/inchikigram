class PostsController < ApplicationController

  before_action :move_to_index, except: :index
    

  
  def index
    @posts = Post.all.order(id: "DESC").limit(30) # ページネーションはなし
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    binding.pry
    Post.create(post_params)  
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  
end
