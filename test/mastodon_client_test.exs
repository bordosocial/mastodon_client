defmodule MastodonClientTest do
  use ExUnit.Case
  doctest MastodonClient

  test "greets the world" do
    assert MastodonClient.hello() == :world
  end
end
