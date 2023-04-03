require "application_system_test_case"

class QoutesTest < ApplicationSystemTestCase
  setup do
    @qoute = qoutes(:first) # Reference to the first fixture qoute
  end

  test "Creating a new qoute" do
    # When we visit the Qoutes#index page
    # we expect to see a title with the text "Qoutes"
    visit qoutes_path
    assert_selector "h1", text: "Qoutes"

    # When we click on the link with the text "New qoute"
    # we expect to land on a page with the title "New qoute"
    click_on "New qoute"
    assert_selector "h1", text: "New qoute"

    # When we fill in the name input with "Capybara qoute"
    # and we click on "Create Qoute"
    fill_in "Name", with: "Capybara qoute"
    click_on "Create qoute"

    # We expect to be back on the page with the title "Qoutes"
    # and to see our "Capybara qoute" added to the list
    assert_selector "h1", text: "Qoutes"
    assert_text "Capybara qoute"
  end

  test "Showing a qoute" do
    visit qoutes_path
    click_link @qoute.name

    assert_selector "h1", text: @qoute.name
  end

  test "Updating a qoute" do
    visit qoutes_path
    assert_selector "h1", text: "Qoutes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit qoute"

    fill_in "Name", with: "Updated qoute"
    click_on "Update qoute"

    assert_selector "h1", text: "Qoutes"
    assert_text "Updated qoute"
  end

  test "Destroying a qoute" do
    visit qoutes_path
    assert_text @qoute.name

    click_on "Delete", match: :first
    assert_no_text @qoute.name
  end
end
