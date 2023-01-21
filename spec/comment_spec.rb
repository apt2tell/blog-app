require 'rails_helper'

describe Comment, type: :model do
  describe 'valdations' do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')

    subject do
      Comment.new(author: @user, text: 'Some comment', post: @post)
    end

    before { subject.save }

    it 'should have a valid text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end
end