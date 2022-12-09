class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
<<<<<<< HEAD
    @current_post = Post.find(params[:post_id])
    @like = @current_post.likes.new
    @like.post_id = @current_post.id
    @like.author_id = current_user.id
    if @like.save
      flash[:success] = 'New like saved successfully'
      redirect_to user_post_path(current_user, @current_post)
    else
      flash[:error] = 'Something went wrong'
      render :new, status: :unprocessable_entity
    end
  end

  def like_params
    params.permit(:text)
  end
=======
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: Current.user.id, post_id: @post.id)

    if @like.save
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      render :new
    end
  end
>>>>>>> 289918409f164a7f36a95e0ae462e6cefa02984f
end
