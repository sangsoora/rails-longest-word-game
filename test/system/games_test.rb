require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    fill_in "word", with: "Hello"
    click_on "submit"

    assert_text "I don't care, get dressed and go to work!"
  end
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    fill_in "question", with: "Hello"
    click_on "Ask"

    assert_text "I don't care, get dressed and go to work!"
  end
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    fill_in "question", with: "Hello"
    click_on "Ask"

    assert_text "I don't care, get dressed and go to work!"
  end
end
