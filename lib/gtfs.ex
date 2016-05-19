defmodule Gtfs do
  def parse(folder) do
    Gtfs.Parser.parse(folder)
  end
end
