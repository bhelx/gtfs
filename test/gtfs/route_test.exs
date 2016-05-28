defmodule GTFS.RouteTest do
  use ExUnit.Case, async: true
  doctest GTFS.Route

  test "from_map transforms a map to a Route" do
    attr_map = %{
      "agency_id": "NORTA",
      "route_color": "006737",
      "route_desc": "description",
      "route_id": "10123",
      "route_long_name": "St. Charles Streetcar",
      "route_short_name": "12",
      "route_text_color": "FFFFFF",
      "route_type": "0",
      "route_url": "http://example.com",
      "trips": []
    }

    expected_route = %GTFS.Route{
      agency_id: "NORTA",
      route_color: "006737",
      route_desc: "description",
      route_id: "10123",
      route_long_name: "St. Charles Streetcar",
      route_short_name: "12",
      route_text_color: "FFFFFF",
      route_type: "0",
      route_url: "http://example.com",
      trips: []
    }

    assert GTFS.Route.from_map(attr_map) == expected_route
  end
end
