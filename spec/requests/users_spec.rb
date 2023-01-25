require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) do
      get users_path
    end

    it 'should return the correct respond status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should display the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should have the correct placeholder text' do
      expect(response.body).to include('User')
    end
  end

  describe 'GET #show' do
    before(:each) do
      get user_path(1)
    end

    it 'should return the correct respond status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should display the correct template' do
      expect(response).to render_template(:show)
    end

    it 'should have the correct placeholder text' do
      expect(response.body).to include('User details')
    end
  end
end
