require 'test_helper'

class ScheduleEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule_entry = schedule_entries(:one)
  end

  test "should get index" do
    get schedule_entries_url, as: :json
    assert_response :success
  end

  test "should create schedule_entry" do
    assert_difference('ScheduleEntry.count') do
      post schedule_entries_url, params: { schedule_entry: { employee_id: @schedule_entry.employee_id, end_time: @schedule_entry.end_time, start_time: @schedule_entry.start_time } }, as: :json
    end

    assert_response 201
  end

  test "should show schedule_entry" do
    get schedule_entry_url(@schedule_entry), as: :json
    assert_response :success
  end

  test "should update schedule_entry" do
    patch schedule_entry_url(@schedule_entry), params: { schedule_entry: { employee_id: @schedule_entry.employee_id, end_time: @schedule_entry.end_time, start_time: @schedule_entry.start_time } }, as: :json
    assert_response 200
  end

  test "should destroy schedule_entry" do
    assert_difference('ScheduleEntry.count', -1) do
      delete schedule_entry_url(@schedule_entry), as: :json
    end

    assert_response 204
  end
end
