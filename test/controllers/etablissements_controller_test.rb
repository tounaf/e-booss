require 'test_helper'

class EtablissementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get etablissements_index_url
    assert_response :success
  end

  test "should get show" do
    get etablissements_show_url
    assert_response :success
  end

  test "should get new" do
    get etablissements_new_url
    assert_response :success
  end

  test "should get create" do
    get etablissements_create_url
    assert_response :success
  end

  test "should get update" do
    get etablissements_update_url
    assert_response :success
  end

  test "should get delete" do
    get etablissements_delete_url
    assert_response :success
  end

end
