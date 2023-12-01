class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes
  has_many :comments
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  ROLES = %i[admin default].freeze
  def is?(requested_role)
    role == requested_role
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def posts_counter
    update(post_counter: posts.count)
  end
end
