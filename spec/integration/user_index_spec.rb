require 'rails_helper'

describe 'GET user#index', type: :feature do
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

    visit users_path
  end

  describe 'View User names' do
    it 'displays names of all users' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
  end

end