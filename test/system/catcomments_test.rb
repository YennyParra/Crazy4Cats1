require "application_system_test_case"

class CatcommentsTest < ApplicationSystemTestCase
  setup do
    @catcomment = catcomments(:one)
  end

  test "visiting the index" do
    visit catcomments_url
    assert_selector "h1", text: "Catcomments"
  end

  test "should create catcomment" do
    visit catcomments_url
    click_on "New catcomment"

    fill_in "Article", with: @catcomment.article_id
    fill_in "Catuser", with: @catcomment.catuser_id
    fill_in "Content", with: @catcomment.content
    click_on "Create Catcomment"

    assert_text "Catcomment was successfully created"
    click_on "Back"
  end

  test "should update Catcomment" do
    visit catcomment_url(@catcomment)
    click_on "Edit this catcomment", match: :first

    fill_in "Article", with: @catcomment.article_id
    fill_in "Catuser", with: @catcomment.catuser_id
    fill_in "Content", with: @catcomment.content
    click_on "Update Catcomment"

    assert_text "Catcomment was successfully updated"
    click_on "Back"
  end

  test "should destroy Catcomment" do
    visit catcomment_url(@catcomment)
    click_on "Destroy this catcomment", match: :first

    assert_text "Catcomment was successfully destroyed"
  end
end
