class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter
    posts.comments_counter
  end
end
