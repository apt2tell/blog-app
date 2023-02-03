require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do

  path '/api/v1/users/{user_id}/posts' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    user = User.create(name: 'Tom', bio: 'Teacher from Mexico', photo: 'http://')
    get('list posts') do
      response(200, 'successful') do
        let(:user_id) { user.id } 

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/posts/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    user = User.create(name: 'Tom', bio: 'Teacher from Mexico', photo: 'http://')
    post = Post.create(author_id: user.id, title: 'Say Hello', text: 'This is my first post')
    
    get('show post') do
      response(200, 'successful') do
        let(:user_id) { user.id}
        let(:id) { post.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
