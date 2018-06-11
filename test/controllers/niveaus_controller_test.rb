require 'test_helper'

class NiveausControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get niveaus_index_url
    assert_response :success
  end

  test "should get new" do
    get niveaus_new_url
    assert_response :success
  end

  test "should get create" do
    get niveaus_create_url
    assert_response :success
  end

  test "should get show" do
    get niveaus_show_url
    assert_response :success
  end

  test "should get edit" do
    get niveaus_edit_url
    assert_response :success
  end

  test "should get update" do
    get niveaus_update_url
    assert_response :success
  end

  test "should get destroy" do
    get niveaus_destroy_url
    assert_response :success
  end

end
