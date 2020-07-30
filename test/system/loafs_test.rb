require "application_system_test_case"

class LoafsTest < ApplicationSystemTestCase
  setup do
    @loaf = loafs(:one)
  end

  test "visiting the index" do
    visit loafs_url
    assert_selector "h1", text: "Loafs"
  end

  test "creating a Loaf" do
    visit loafs_url
    click_on "New Loaf"

    click_on "Create Loaf"

    assert_text "Loaf was successfully created"
    click_on "Back"
  end

  test "updating a Loaf" do
    visit loafs_url
    click_on "Edit", match: :first

    click_on "Update Loaf"

    assert_text "Loaf was successfully updated"
    click_on "Back"
  end

  test "destroying a Loaf" do
    visit loafs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loaf was successfully destroyed"
  end
end
