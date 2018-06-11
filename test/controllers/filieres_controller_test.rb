require 'test_helper'

class FilieresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get filieres_index_url
    assert_response :success
  end

  test "should get new" do
    get filieres_new_url
    assert_response :success
  end

  test "should get create" do
    get filieres_create_url
    assert_response :success
  end

  test "should get show" do
    get filieres_show_url
    assert_response :success
  end

  test "should get edit" do
    get filieres_edit_url
    assert_response :success
  end

  test "should get update" do
    get filieres_update_url
    assert_response :success
  end

  test "should get destroy" do
    get filieres_destroy_url
    assert_response :success
  end

end
