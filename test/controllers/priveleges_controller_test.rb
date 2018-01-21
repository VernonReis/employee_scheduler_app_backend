require 'test_helper'

class PrivelegesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @privelege = priveleges(:one)
  end

  test "should get index" do
    get priveleges_url, as: :json
    assert_response :success
  end

  test "should create privelege" do
    assert_difference('Privelege.count') do
      post priveleges_url, params: { privelege: { auth_level: @privelege.auth_level, user_id: @privelege.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show privelege" do
    get privelege_url(@privelege), as: :json
    assert_response :success
  end

  test "should update privelege" do
    patch privelege_url(@privelege), params: { privelege: { auth_level: @privelege.auth_level, user_id: @privelege.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy privelege" do
    assert_difference('Privelege.count', -1) do
      delete privelege_url(@privelege), as: :json
    end

    assert_response 204
  end
end
