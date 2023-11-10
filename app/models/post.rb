class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :update_posts_counter
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    author.posts_counter
  end

  def comments_counter
    update(comment_counter: comments.count)
  end

  def likes_counter
    update(like_counter: likes.count)
  end
end
