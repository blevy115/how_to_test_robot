require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1


    r = Robot.new
    r.needs_repairs = true
    r.foreign_model = true

    expected_value = 1
    actual_value = r.station

    assert_equal(expected_value, actual_value)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    r = Robot.new
    r.needs_repairs = true
    r.vintage_model = true

    expected_value = 2
    actual_value = r.station

    assert_equal(expected_value, actual_value)

  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    r = Robot.new
    r.needs_repairs = true


    expected_value = 3
    actual_value = r.station

    assert_equal(expected_value, actual_value)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    r = Robot.new



    expected_value = 4
    actual_value = r.station

    assert_equal(expected_value, actual_value)

  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    r = Robot.new

    actual_value = r.prioritize_tasks
    expected_value = -1

    assert_equal(expected_value, actual_value)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    r = Robot.new
    r.todos = [4,2]
    actual_value = r.prioritize_tasks
    expected_value = 4

    assert_equal(expected_value, actual_value)
  end

  def test_workday_on_day_off_returns_false
    r = Robot.new
    r.day_off = "Saturday"
    actual_value = r.workday?("Saturday")
    expected_value = false

    assert_equal(expected_value, actual_value)
  end

  def test_workday_not_day_off_returns_true
    r = Robot.new
    r.day_off = "Saturday"
    actual_value = r.workday?("Monday")
    expected_value = true

    assert_equal(expected_value, actual_value)
  end

end
