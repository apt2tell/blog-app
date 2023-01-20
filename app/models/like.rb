class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :increment_like_count

  def increment_like_count
    post.increment!(:likes_count)
  end

  increment_like_count
end
