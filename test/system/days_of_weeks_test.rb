require "application_system_test_case"

class DaysOfWeeksTest < ApplicationSystemTestCase
  setup do
    @days_of_week = days_of_weeks(:one)
  end

  test "visiting the index" do
    visit days_of_weeks_url
    assert_selector "h1", text: "Days Of Weeks"
  end

  test "creating a Days of week" do
    visit days_of_weeks_url
    click_on "New Days Of Week"

    check "Open" if @days_of_week.open
    fill_in "Title", with: @days_of_week.title
    click_on "Create Days of week"

    assert_text "Days of week was successfully created"
    click_on "Back"
  end

  test "updating a Days of week" do
    visit days_of_weeks_url
    click_on "Edit", match: :first

    check "Open" if @days_of_week.open
    fill_in "Title", with: @days_of_week.title
    click_on "Update Days of week"

    assert_text "Days of week was successfully updated"
    click_on "Back"
  end

  test "destroying a Days of week" do
    visit days_of_weeks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Days of week was successfully destroyed"
  end
end
