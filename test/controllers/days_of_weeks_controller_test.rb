require 'test_helper'

class DaysOfWeeksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @days_of_week = days_of_weeks(:one)
  end

  test "should get index" do
    get days_of_weeks_url
    assert_response :success
  end

  test "should get new" do
    get new_days_of_week_url
    assert_response :success
  end

  test "should create days_of_week" do
    assert_difference('DaysOfWeek.count') do
      post days_of_weeks_url, params: { days_of_week: { open: @days_of_week.open, title: @days_of_week.title } }
    end

    assert_redirected_to days_of_week_url(DaysOfWeek.last)
  end

  test "should show days_of_week" do
    get days_of_week_url(@days_of_week)
    assert_response :success
  end

  test "should get edit" do
    get edit_days_of_week_url(@days_of_week)
    assert_response :success
  end

  test "should update days_of_week" do
    patch days_of_week_url(@days_of_week), params: { days_of_week: { open: @days_of_week.open, title: @days_of_week.title } }
    assert_redirected_to days_of_week_url(@days_of_week)
  end

  test "should destroy days_of_week" do
    assert_difference('DaysOfWeek.count', -1) do
      delete days_of_week_url(@days_of_week)
    end

    assert_redirected_to days_of_weeks_url
  end
end
