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

    assert length(route.trips) == 10
    trip = List.first(route.trips)

    assert Utils.is_trip(trip)

    assert length(trip.shapes) == 189
  end
end
