# GTFS [![Build Status](https://travis-ci.org/bhelx/gtfs.svg?branch=master)](https://travis-ci.org/bhelx/gtfs)

This library allows you to parse GTFS folders into a hierarchy of structs representing the
[available GTFS data types](https://developers.google.com/transit/gtfs/reference). It's
currently a work in progress. I've only implmented as much as I need for now.

## Installation

The library is currently published to [Hex](https://hex.pm/packages/gtfs). To use, add as a dependency to your mix file:

```elixir
  def deps do
    [{:gtfs, "~> 0.3"}]
  end
```

