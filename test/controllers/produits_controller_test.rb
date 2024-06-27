require "test_helper"

class ProduitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get produits_index_url
    assert_response :success
  end

  test "should get show" do
    get produits_show_url
    assert_response :success
  end

  test "should get new" do
    get produits_new_url
    assert_response :success
  end

  test "should get edit" do
    get produits_edit_url
    assert_response :success
  end
end
