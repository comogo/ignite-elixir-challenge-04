defmodule ParallelReportTest do
  use ExUnit.Case

  describe "build/1" do
    test "generates the report" do
      filename = "report_test.csv"

      result = ParallelReport.build(filename)

      expectation = %{
        all_hours: %{jane: 13, john: 15},
        hours_per_month: %{jane: %{fevereiro: 5, janeiro: 8}, john: %{janeiro: 15}},
        hours_per_year: %{jane: %{"2015": 8, "2016": 5}, john: %{"2015": 15}}
      }

      assert result == expectation
    end
  end

  describe "build_parallel/1" do
    test "generates the report" do
      filename = "gen_report.csv"
      filenames = ["part_1.csv", "part_2.csv", "part_3.csv"]

      result = ParallelReport.build_parallel(filenames)

      expectation = ParallelReport.build(filename)

      assert result == expectation
    end
  end
end
