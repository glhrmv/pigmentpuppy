defmodule PigmentpuppyTest do
  use ExUnit.Case
  doctest Pigmentpuppy

  test "greets the world" do
    assert Pigmentpuppy.hello() == :world
  end
end
