class Comment < ApplicationRecord
<<<<<<< HEAD
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_comment_counter

  private

  def update_comment_counter
=======
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_comments_counter

  private

  def update_comments_counter
>>>>>>> 289918409f164a7f36a95e0ae462e6cefa02984f
    post.increment!(:comments_counter)
  end
end
