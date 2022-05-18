require "test_helper"

class Admin::StadiumsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_stadiums_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_stadiums_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_stadiums_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_stadiums_edit_url
    assert_response :success
  end
end
