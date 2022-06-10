require "application_system_test_case"

class BadgesTest < ApplicationSystemTestCase
  setup do
    @badge = badges(:one)
  end

  test "visiting the index" do
    visit badges_url
    assert_selector "h1", text: "badges"
  end

  test "creating a badge" do
    visit badges_url
    click_on "New badge"

    fill_in "Img url", with: @badge.img_url
    fill_in "Name", with: @badge.name
    click_on "Create badge"

    assert_text "badge was successfully created"
    click_on "Back"
  end

  test "updating a badge" do
    visit badges_url
    click_on "Edit", match: :first

    fill_in "Img url", with: @badge.img_url
    fill_in "Name", with: @badge.name
    click_on "Update badge"

    assert_text "badge was successfully updated"
    click_on "Back"
  end

  test "destroying a badge" do
    visit badges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "badge was successfully destroyed"
  end
end
