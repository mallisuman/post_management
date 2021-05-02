class PostsController < ApplicationController
  # before_filter :authenticate_user!
  # before_action :set_post, only: [:create, :destroy]
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
    # @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @user.post_users.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
     @post = Post.new(post_params)
     # @post.user = current_user
     

     if @post.save
       redirect_to @post
      else
       render 'new'
      end  
  end

  def update
    @post = Post.find(params[:id])
 
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to posts_path
  end

  private
    # def set_post
    #   @post = Post.find(params[:id])
    # end

    def post_params
      params.require(:post).permit(:name, :user_id, post_users_attributes: [:post_id, :user_id])
    end
end

