class User < ApplicationRecord
<<<<<<< HEAD
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
=======
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
>>>>>>> 289918409f164a7f36a95e0ae462e6cefa02984f

  # Name must not be blank.
  validates :name, presence: true
<<<<<<< HEAD
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
=======
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
>>>>>>> 289918409f164a7f36a95e0ae462e6cefa02984f

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
