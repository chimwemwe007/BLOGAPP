class User < ApplicationRecord
<<<<<<< HEAD
  has_many :post, foreign_key: 'author_id'
  has_many :comment, foreign_key: 'author_id'
  has_many :like, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
=======
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
>>>>>>> a84e878566ac4c3820d02ce9889d3f621b67f9fa

  def recent_posts
    post.order(created_at: :desc).limit(3)
  end
end
