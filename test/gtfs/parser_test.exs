defmodule Gtfs.ParserTest do
  use ExUnit.Case, async: true
  doctest Gtfs.Parser

  test "load_csv_streams loads the stream for each file" do
    streams = Gtfs.Parser.load_csv_streams("./test/data")

    assert Utils.is_stream(streams[:routes])
    assert Utils.is_stream(streams[:trips])
    assert Utils.is_stream(streams[:shapes])
    assert Utils.is_stream(streams[:stops])
  end

  test "parse builds the Structs and hierarchy" do
    data = Gtfs.Parser.parse("./test/data")

    assert data.route_short_names ==  %{"12" => "10123", "80" => "9855"}
    assert Map.keys(data.routes) == ["10123", "9855"]

    route = data.routes["10123"]

    assert Utils.is_route(route)
    assert length(route.shapes) == 404

    shape = List.first(route.shapes)

    assert Utils.is_shape(shape)
  end
end
