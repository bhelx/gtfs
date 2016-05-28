defmodule GTFS.ParserTest do
  use ExUnit.Case, async: true
  doctest GTFS.Parser

  @test_gtfs_folder "./test/data"

  test "load_csv_streams loads the stream for each file" do
    streams = GTFS.Parser.load_csv_streams(@test_gtfs_folder)

    assert Utils.is_stream(streams[:routes])
    assert Utils.is_stream(streams[:trips])
    assert Utils.is_stream(streams[:shapes])
    assert Utils.is_stream(streams[:stops])
  end

  test "parse builds the Structs and hierarchy" do
    data = GTFS.Parser.parse("./test/data")

    assert data.route_short_names ==  %{"12" => "10123", "80" => "9855"}
    assert Map.keys(data.routes) == ["10123", "9855"]

    route = data.routes["10123"]

    assert Utils.is_route(route)

    assert length(Map.keys(route.trips)) == 10

    first = route.trips |> Map.keys |> List.first
    trip = Map.get(route.trips, first)

    assert Utils.is_trip(trip)

    shape_ids =
      route.trips
      |> Enum.map(fn {_id, t}-> t.shape_id end)
      |> Enum.uniq

    assert length(shape_ids) == 2

    assert length(Map.keys(route.shapes)) == 2

    shape =
      route.shapes
      |> Map.get(List.first(shape_ids))
      |> List.first

    assert Utils.is_shape(shape)
  end
end
