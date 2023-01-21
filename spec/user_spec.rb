require 'rails_helper'

describe User, type: :model do
  subject do
    User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  before { subject.save }

  describe '#name' do
    it 'should have name present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#postscounter to be >= 0' do
    it 'should be greater than 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should be equal to 0' do
      subject.posts_counter = 0
      expect(subject).to be_valid
    end

    it 'should be greater than 0' do
      subject.posts_counter = 3
      expect(subject).to be_valid
    end
  end

  describe '#most_recent_posts' do
    before do
      5.times do |i|
        Post.create(author: subject, title: "#{i} Post")
      end
    end

    it 'should return the 3 most recent posts' do
      expect(subject.recent_posts).to eq subject.posts.order(created_at: :desc).limit(3)
    end
  end
end