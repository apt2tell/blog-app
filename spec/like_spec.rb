require 'rails_helper'

describe Like, type: :model do
  describe 'valdations' do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')

    subject do
      Like.new(author: @user, post: @post)
    end

    before { subject.save }

    it 'should not have a blank title' do
      subject.created_at = nil
      expect(subject).to be_invalid
    end
  end
end
