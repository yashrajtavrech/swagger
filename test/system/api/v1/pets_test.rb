require "application_system_test_case"

class Api::V1::PetsTest < ApplicationSystemTestCase
  setup do
    @api_v1_pet = api_v1_pets(:one)
  end

  test "visiting the index" do
    visit api_v1_pets_url
    assert_selector "h1", text: "Pets"
  end

  test "should create pet" do
    visit api_v1_pets_url
    click_on "New pet"

    click_on "Create Pet"

    assert_text "Pet was successfully created"
    click_on "Back"
  end

  test "should update Pet" do
    visit api_v1_pet_url(@api_v1_pet)
    click_on "Edit this pet", match: :first

    click_on "Update Pet"

    assert_text "Pet was successfully updated"
    click_on "Back"
  end

  test "should destroy Pet" do
    visit api_v1_pet_url(@api_v1_pet)
    click_on "Destroy this pet", match: :first

    assert_text "Pet was successfully destroyed"
  end
end
