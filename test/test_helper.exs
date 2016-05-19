defmodule Utils do
  def is_stream(%Stream{}), do: true
  def is_stream(_), do: false

  def is_route(%Gtfs.Route{}), do: true
  def is_route(_), do: false

  def is_shape(%Gtfs.Shape{}), do: true
  def is_shape(_), do: false
end

ExUnit.start()
