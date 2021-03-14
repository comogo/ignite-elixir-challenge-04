defmodule ParallelReport.Parser do
  @moduledoc """
  ParallelReport file parser.
  """
  @months {
    :janeiro,
    :fevereiro,
    :março,
    :abril,
    :maio,
    :junho,
    :julho,
    :agosto,
    :setembro,
    :outubro,
    :novembro,
    :dezembro
  }

  @doc """
  Open the file as a stream an parsers each line.
  """
  @spec parse_file(String.t()) :: Enumerable.t()
  def parse_file(filename) do
    "data/#{filename}"
    |> File.stream!()
    |> Stream.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.downcase()
    |> String.split(",")
    |> list_to_map()
  end

  defp list_to_map([name, hour, _day, month, year]) do
    %{
      name: String.to_atom(name),
      hours: String.to_integer(hour),
      month: month_name(month),
      year: String.to_atom(year)
    }
  end

  defp month_name(month_number) do
    number = String.to_integer(month_number)
    elem(@months, number - 1)
  end
end
