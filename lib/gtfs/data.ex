defmodule Gtfs.Data do
  defstruct ~w(
    route_short_names
    routes
  )a

  def from_map(attr_map) do
    struct(__MODULE__, attr_map)
  end
end
