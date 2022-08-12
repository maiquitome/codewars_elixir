defmodule HumanReadableDurationFormatTest do
  use ExUnit.Case
  import HumanReadableDurationFormat, only: [format_duration: 1]

  test "format_duration" do
    assert format_duration(0) == "now"

    assert format_duration(1) == "1 second"
    assert format_duration(2) == "2 seconds"
    assert format_duration(59) == "59 seconds"

    assert format_duration(60) == "1 minute"
    assert format_duration(61) == "1 minute and 1 second"
    assert format_duration(62) == "1 minute and 2 seconds"
    assert format_duration(120) == "2 minutes"
    assert format_duration(180) == "3 minutes"
    assert format_duration(3599) == "59 minutes and 59 seconds"

    assert format_duration(3600) == "1 hour"
    assert format_duration(3600 * 2) == "2 hours"
    assert format_duration(3600 * 23) == "23 hours"
    assert format_duration(3600 * 24) == "1 day"
    assert format_duration(3660) == "1 hour and 1 minute"
    assert format_duration(3660 * 2) == "2 hours and 2 minutes"
    assert format_duration(3601) == "1 hour and 1 second"
    assert format_duration(3661) == "1 hour, 1 minute and 1 second"
    assert format_duration(3662) == "1 hour, 1 minute and 2 seconds"
    assert format_duration(3662 * 2) == "2 hours, 2 minutes and 4 seconds"
    assert format_duration(3722) == "1 hour, 2 minutes and 2 seconds"
    assert format_duration(25317) == "7 hours, 1 minute and 57 seconds"

    assert format_duration(86400) == "1 day"
    assert format_duration(86460) == "1 day and 1 minute"
    assert format_duration(86461) == "1 day, 1 minute and 1 second"
    assert format_duration(86400 * 2) == "2 days"
    assert format_duration(86400 * 364) == "364 days"
    assert format_duration(1_530_319) == "17 days, 17 hours, 5 minutes and 19 seconds"
    assert format_duration(15_731_080) == "182 days, 1 hour, 44 minutes and 40 seconds"

    assert format_duration(1_846_217) == "21 days, 8 hours, 50 minutes and 17 seconds"
    assert format_duration(472_164) == "5 days, 11 hours, 9 minutes and 24 seconds"
    assert format_duration(7_566_422) == "87 days, 13 hours, 47 minutes and 2 seconds"
    assert format_duration(1_746_613) == "20 days, 5 hours, 10 minutes and 13 seconds"
    assert format_duration(3_628_824) == "42 days and 24 seconds"

    assert format_duration(31_536_000) == "1 year"
    assert format_duration(31_536_001) == "1 year and 1 second"
    assert format_duration(31_536_060) == "1 year and 1 minute"
    assert format_duration(31_536_061) == "1 year, 1 minute and 1 second"
    assert format_duration(31_536_000 * 2) == "2 years"
    assert format_duration(31_536_000 * 364) == "364 years"

    assert format_duration(132_030_240) == "4 years, 68 days, 3 hours and 4 minutes"
  end
end
