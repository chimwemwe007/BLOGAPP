class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
<<<<<<< HEAD
    @posts = @user.posts.includes(:author)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = @post.comments.includes(:post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_post_path(current_user, @post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
=======
    @posts = Post.where(author: @user)
  end

  def show
    puts params
    @post = Post.find(params[:id])
>>>>>>> e9c2032195cbf0c98c447a9f4d718028676a1f3f
  end
end
