require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit posts_url
    click_on "New post"

    fill_in "Author", with: @post.author_id
    fill_in "Commentcounter", with: @post.commentCounter
    fill_in "Created at", with: @post.created_at
    fill_in "Likescounter", with: @post.likesCounter
    fill_in "Text", with: @post.text
    fill_in "Title", with: @post.title
    fill_in "Updated at", with: @post.updated_at
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "should update Post" do
    visit post_url(@post)
    click_on "Edit this post", match: :first

    fill_in "Author", with: @post.author_id
    fill_in "Commentcounter", with: @post.commentCounter
    fill_in "Created at", with: @post.created_at
    fill_in "Likescounter", with: @post.likesCounter
    fill_in "Text", with: @post.text
    fill_in "Title", with: @post.title
    fill_in "Updated at", with: @post.updated_at
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit post_url(@post)
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
