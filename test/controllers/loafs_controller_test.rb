require 'test_helper'

class LoafsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loaf = loafs(:one)
  end

  test "should get index" do
    get loafs_url
    assert_response :success
  end

  test "should get new" do
    get new_loaf_url
    assert_response :success
  end

  test "should create loaf" do
    assert_difference('Loaf.count') do
      post loafs_url, params: { loaf: {  } }
    end

    assert_redirected_to loaf_url(Loaf.last)
  end

  test "should show loaf" do
    get loaf_url(@loaf)
    assert_response :success
  end

  test "should get edit" do
    get edit_loaf_url(@loaf)
    assert_response :success
  end

  test "should update loaf" do
    patch loaf_url(@loaf), params: { loaf: {  } }
    assert_redirected_to loaf_url(@loaf)
  end

  test "should destroy loaf" do
    assert_difference('Loaf.count', -1) do
      delete loaf_url(@loaf)
    end

    assert_redirected_to loafs_url
  end
end
