require 'test_helper'

class PayPeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pay_period = pay_periods(:one)
  end

  test "should get index" do
    get pay_periods_url, as: :json
    assert_response :success
  end

  test "should create pay_period" do
    assert_difference('PayPeriod.count') do
      post pay_periods_url, params: { pay_period: { employer_id: @pay_period.employer_id, start_date: @pay_period.start_date } }, as: :json
    end

    assert_response 201
  end

  test "should show pay_period" do
    get pay_period_url(@pay_period), as: :json
    assert_response :success
  end

  test "should update pay_period" do
    patch pay_period_url(@pay_period), params: { pay_period: { employer_id: @pay_period.employer_id, start_date: @pay_period.start_date } }, as: :json
    assert_response 200
  end

  test "should destroy pay_period" do
    assert_difference('PayPeriod.count', -1) do
      delete pay_period_url(@pay_period), as: :json
    end

    assert_response 204
  end
end
