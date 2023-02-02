class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  after_initialize :set_default

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  # Most recent posts
  def recent_posts
    posts.first(3)
  end

  def set_default
    self.posts_counter = 0 if posts_counter.nil?
  end

  ROLES = %i[admin user].freeze

  def admin?
    role == :admin
  end
end
