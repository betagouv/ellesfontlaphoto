require "application_system_test_case"

class ContactsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"

    assert_selector "h1", text: "Accompagner les femmes photographes dans leur carrière"
  end
end
