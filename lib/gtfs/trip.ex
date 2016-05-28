defmodule GTFS.Trip do
  defstruct ~w(
    route_id
    service_id
    trip_id
    trip_headsign
    trip_short_name
    direction_id
    block_id
    shape_id
    wheelchair_accessible
    bikes_allowed
  )a

  def from_map(attr_map) do
    atomized_map =
      attr_map
      |> Enum.map(fn {k, v} -> {to_atom(k), strip(v)} end)

    struct(__MODULE__, atomized_map)
  end

  defp to_atom(v) do
    if is_binary(v) do
      String.to_atom(v)
    else
      v
    end
  end

  defp strip(v) do
    if is_binary(v) do
      String.strip(v)
    else
      v
    end
  end
end
