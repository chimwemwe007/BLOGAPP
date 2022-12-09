class CommentsController < ApplicationController
  def new
    @comments = Comment.new
  end

  def create
    @current_post = Post.find(params[:post_id])
    @comments = @current_post.comments.new(comment_params)
    @comments.post_id = @current_post.id
<<<<<<< HEAD
    @comments.author_id = current_user.id
    if @comments.save
      flash[:success] = 'New comment saved successfully'
      redirect_to "/users/#{@current_post.author.id}/posts/#{@current_post.id}"

    else
      flash[:error] = 'Something went wrong'
      render :new, status: :unprocessable_entity
    end
  end

  def comment_params
    params.permit(:text)
=======
    @comments.author_id = Current.user.id

    if @comments.save
      redirect_to "/users/#{@current_post.author_id}/posts/#{@current_post.id}"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
>>>>>>> 289918409f164a7f36a95e0ae462e6cefa02984f
  end
end
