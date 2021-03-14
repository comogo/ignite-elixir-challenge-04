defmodule ParallelReport.ParserTest do
  use ExUnit.Case

  alias ParallelReport.Parser

  describe "parse_file/1" do
    test "parses the file" do
      result =
        "report_test.csv"
        |> Parser.parse_file()
        |> Enum.map(& &1)

      expectation = [
        %{hours: 7, month: :janeiro, name: :john, year: :"2015"},
        %{hours: 8, month: :janeiro, name: :john, year: :"2015"},
        %{hours: 8, month: :janeiro, name: :jane, year: :"2015"},
        %{hours: 5, month: :fevereiro, name: :jane, year: :"2016"}
      ]

      assert result == expectation
    end
  end
end
