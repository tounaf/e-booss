require 'test_helper'

class NiveausupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get niveausups_index_url
    assert_response :success
  end

  test "should get new" do
    get niveausups_new_url
    assert_response :success
  end

  test "should get create" do
    get niveausups_create_url
    assert_response :success
  end

  test "should get show" do
    get niveausups_show_url
    assert_response :success
  end

  test "should get edit" do
    get niveausups_edit_url
    assert_response :success
  end

  test "should get update" do
    get niveausups_update_url
    assert_response :success
  end

  test "should get destroy" do
    get niveausups_destroy_url
    assert_response :success
  end

end
