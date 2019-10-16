class PostsController < ApplicationController

  def index
    @posts = Post.all # ページネーションは後で
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)  
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
