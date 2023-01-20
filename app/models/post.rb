class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_create :increment_user_post_count

  # Increment user posts count
  def increment_user_post_count
    user.increment!(:posts_count)
  end

  # Return user most recent comments
  def recent_comments
    comments.order(created_at::desc).limit(5)
  end
end
