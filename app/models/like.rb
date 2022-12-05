class Like < ApplicationRecord
<<<<<<< HEAD
  belongs_to :author, class_name: 'User'
  belongs_to :post
=======
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

>>>>>>> a84e878566ac4c3820d02ce9889d3f621b67f9fa
  after_save :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
