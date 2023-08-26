require "test_helper"

class CatcommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catcomment = catcomments(:one)
  end

  test "should get index" do
    get catcomments_url
    assert_response :success
  end

  test "should get new" do
    get new_catcomment_url
    assert_response :success
  end

  test "should create catcomment" do
    assert_difference("Catcomment.count") do
      post catcomments_url, params: { catcomment: { article_id: @catcomment.article_id, catuser_id: @catcomment.catuser_id, content: @catcomment.content } }
    end

    assert_redirected_to catcomment_url(Catcomment.last)
  end

  test "should show catcomment" do
    get catcomment_url(@catcomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_catcomment_url(@catcomment)
    assert_response :success
  end

  test "should update catcomment" do
    patch catcomment_url(@catcomment), params: { catcomment: { article_id: @catcomment.article_id, catuser_id: @catcomment.catuser_id, content: @catcomment.content } }
    assert_redirected_to catcomment_url(@catcomment)
  end

  test "should destroy catcomment" do
    assert_difference("Catcomment.count", -1) do
      delete catcomment_url(@catcomment)
    end

    assert_redirected_to catcomments_url
  end
end
