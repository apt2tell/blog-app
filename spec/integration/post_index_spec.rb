require 'rails_helper'

RSpec.describe 'post#index', type: :feature do
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
        title: 'Hello',
        text: 'This is my first post'
      ),
      Post.create(
        author: @users.first,
        title: 'Hello',
        text: 'This is my second post'
      ),
      Post.create(
        author: @users.first,
        title: 'Hello',
        text: 'This is my third post'
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

    visit user_posts_path(@users.first)
  end

  describe 'User post index page' do
    it "displays user's profile picture" do
      @users.each do |user|
        expect(page).to have_css("img[src='#{user.photo}']")
      end
    end

    it "has user's username" do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'displays number of posts the user has written' do
      @users.each do |user|
        expect(page).to have_content("Number of posts: #{user.posts_counter}")
      end
    end

    it "has post's title" do
      @posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end

    it "displays post's body" do
      @posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end

    it 'has first comments on a post' do
      @posts.first.most_recent_comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end

    it 'displays number of comments a post has' do
      @posts.each do |post|
        expect(page).to have_content("Comments: #{post.comments_counter}")
      end
    end

    it 'has a section pagination if there are more posts' do
      expect(page).to have_content('Pagination')
    end
  end

end
