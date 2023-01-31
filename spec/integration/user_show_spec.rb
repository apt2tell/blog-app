require 'rails_helper'

RSpec.describe 'GET users#show', type: :feature do
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

    visit user_path(@users.first)
  end

  describe 'User visits show page and sees user info' do
    it "displays user's profile picture" do
      expect(page).to have_css("img[src='#{@users.first.photo}']")
    end

    it "shows user's username" do
      expect(page).to have_content(@users.first.name)
    end

    it "renders the number of user's posts" do
      expect(page).to have_content("Number of posts: #{@users.first.posts_counter}")
    end

    it "renders  user's bio" do
      expect(page).to have_content(@users.first.bio)
    end

    it "renders the number of user's posts count" do
      @users.first.recent_posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end

    it "displays all user's posts" do
      expect(page).to have_link('See all posts', href: user_posts_path(@users.first))
    end
  end

  describe "See all posts and user's post index page" do
    it 'should have the View More Button' do
      @posts.each do |post|
        expect(page).to have_link('View More', href: user_post_path(@users.first, post))
      end
    end

    it 'should redirect to the user details page' do
      click_link('View More', href: user_post_path(@users.first, @posts.first))
      expect(page).to have_current_path(user_post_path(@users.first, @posts.first))
    end
  end
end
