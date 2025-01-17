require "test_helper"

class Api::V1::PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_pet = api_v1_pets(:one)
  end

  test "should get index" do
    get api_v1_pets_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_pet_url
    assert_response :success
  end

  test "should create api_v1_pet" do
    assert_difference("Api::V1::Pet.count") do
      post api_v1_pets_url, params: { api_v1_pet: {  } }
    end

    assert_redirected_to api_v1_pet_url(Api::V1::Pet.last)
  end

  test "should show api_v1_pet" do
    get api_v1_pet_url(@api_v1_pet)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_pet_url(@api_v1_pet)
    assert_response :success
  end

  test "should update api_v1_pet" do
    patch api_v1_pet_url(@api_v1_pet), params: { api_v1_pet: {  } }
    assert_redirected_to api_v1_pet_url(@api_v1_pet)
  end

  test "should destroy api_v1_pet" do
    assert_difference("Api::V1::Pet.count", -1) do
      delete api_v1_pet_url(@api_v1_pet)
    end

    assert_redirected_to api_v1_pets_url
  end
end
