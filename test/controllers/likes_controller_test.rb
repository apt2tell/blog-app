require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:one)
  end

  test 'should get index' do
    get likes_url
    assert_response :success
  end

  test 'should get new' do
    get new_like_url
    assert_response :success
  end

  test 'should create like' do
    assert_difference('Like.count') do
      post likes_url,
           params: { like: { author_id: @like.author_id, created_at: @like.created_at, post_id: @like.post_id,
                             updated_at: @like.updated_at } }
    end

    assert_redirected_to like_url(Like.last)
  end

  test 'should show like' do
    get like_url(@like)
    assert_response :success
  end

  test 'should get edit' do
    get edit_like_url(@like)
    assert_response :success
  end

  test 'should update like' do
    patch like_url(@like),
          params: { like: { author_id: @like.author_id, created_at: @like.created_at, post_id: @like.post_id,
                            updated_at: @like.updated_at } }
    assert_redirected_to like_url(@like)
  end

  test 'should destroy like' do
    assert_difference('Like.count', -1) do
      delete like_url(@like)
    end

    assert_redirected_to likes_url
  end
end
