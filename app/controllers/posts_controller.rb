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
=======
    @pagy, @posts = pagy(@user.posts, items: 2)
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.find(params[:id])
    @comments = @posts.comments
>>>>>>> 289918409f164a7f36a95e0ae462e6cefa02984f
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
<<<<<<< HEAD
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

=======
    @post.author_id = Current.user.id
    if @post.save
      redirect_to "/users/#{Current.user.id}/posts"
    else
      render :new
    end
  end

>>>>>>> 289918409f164a7f36a95e0ae462e6cefa02984f
  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
