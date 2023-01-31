require 'rails_helper'

describe 'GET posts#show', type: :feature do
  before(:each) do
    @users = [
      User.create(
        name: 'Tom',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: 2
      ),
      User.create(
        name: 'Lilly',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Poland.',
        posts_counter: 5
      )
    ]

    @posts = [
      Post.create(
        author: @users.first,
        title: 'First Post',
        text: 'This is my first post'
      ),
      Post.create(
        author: @users.first,
        title: 'Second Post',
        text: 'This is my second post'
      )
    ]

    @comments = [
      Comment.create(
        post: @posts.first,
        author: @users.last,
        text: 'Hi Tom!'
      ),
      Comment.create(
        post: @posts.first,
        author: @users.last,
        text: 'Way to go! man'
      )
    ]

    visit user_post_path(@users.first, @posts.first)
  end

  describe 'Post Title' do
    it 'should display the post title' do
      expect(page).to have_content @posts.first.title
    end
  end

  describe 'Post Author' do
    it 'should display the post author' do
      expect(page).to have_content @posts.first.author.name
    end
  end

  describe 'Post Comments' do
    it 'should display the comments counter for post' do
      expect(page).to have_content "Comments: #{@posts.first.comments_counter}"
    end
  end

  describe 'Post Likes' do
    it 'should display the likes counter for post' do
      expect(page).to have_content "Likes: #{@posts.first.likes_counter}"
    end
  end

  describe 'Post Body' do
    it 'should display the post content' do
      expect(page).to have_content @posts.first.text
    end
  end

  describe "Comment's Author" do
    it "should display the comment's author" do
      @posts.first.comments.each do |comment|
        expect(page).to have_content comment.author.name
      end
    end
  end

  describe "Comment's Body" do
    it "should display the comment's body" do
      @posts.first.comments.each do |comment|
        expect(page).to have_content comment.text
      end
    end
  end
end
