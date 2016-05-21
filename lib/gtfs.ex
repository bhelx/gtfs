defmodule GTFS do
  def parse(folder) do
    GTFS.Parser.parse(folder)
  end
end
