class Like < ApplicationRecord
<<<<<<< HEAD
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_like_counter

  private

  def update_like_counter
=======
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_likes_counter

  private

  def update_likes_counter
>>>>>>> 289918409f164a7f36a95e0ae462e6cefa02984f
    post.increment!(:likes_counter)
  end
end
