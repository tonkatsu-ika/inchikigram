class PostsController < ApplicationController

  before_action :move_to_index, except: :index
    
  
  def index
    @posts = Post.includes(:user).all.order(id: "DESC").limit(30) # ページネーションはなし
    @tag = Hashtag.find_by(hashname: params[:name])
  end

  def show
  end

  def new
    @post = Post.new
    @user_name = current_user.user_name
  end

  def create
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

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts.build
    @post = @tag.posts.page(params[:page])
  end

  private

  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  
end
