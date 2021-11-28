defmodule MastodonClient do
  @moduledoc """
  HTTP client for Mastodon and Pleroma based on `Tesla`.

  All HTTP functions take a `t:MastodonClient.Conn.t/0` struct
  and return a `t:Tesla.Env.result/0`.

  ```elixir
  %MastodonClient{
    instance: "https://gleasonator.com",
    access_token: "OkgdLaYHU8A6Dc70eW7gSfBQzPFpwWI6UfHg2F2zQdM"
  }
  |> MastodonClient.get("/api/v1/instance")
  ```
  """
  alias MastodonClient.Conn

  @doc """
  Build a Tesla client for use with Tesla HTTP functions.
  You usually shouldn't need to call this function directly.
  Prefer to use `get/3`, `post/4`, etc.

  ```elixir
  conn = %MastodonClient.Conn{instance: "https://gleasonator.com"}
  client = MastodonClient.new(conn)

  Tesla.get(client, "/api/v1/instance")
  ```
  """
  @spec new(Conn.t()) :: Tesla.Client.t()
  def new(%Conn{} = conn) do
    middleware = [
      {Tesla.Middleware.BaseUrl, conn.instance},
      {Tesla.Middleware.BearerAuth, token: conn.access_token},
      Tesla.Middleware.JSON
    ]

    Tesla.client(middleware)
  end

  def get(%Conn{} = conn, url, opts \\ []) do
    client = new(conn)
    Tesla.get(client, url, opts)
  end

  def get!(%Conn{} = conn, url, opts \\ []) do
    client = new(conn)
    Tesla.get!(client, url, opts)
  end

  def delete(%Conn{} = conn, url, opts \\ []) do
    client = new(conn)
    Tesla.delete(client, url, opts)
  end

  def delete!(%Conn{} = conn, url, opts \\ []) do
    client = new(conn)
    Tesla.delete!(client, url, opts)
  end

  def head(%Conn{} = conn, url, opts \\ []) do
    client = new(conn)
    Tesla.head(client, url, opts)
  end

  def head!(%Conn{} = conn, url, opts \\ []) do
    client = new(conn)
    Tesla.head!(client, url, opts)
  end

  def options(%Conn{} = conn, url, opts \\ []) do
    client = new(conn)
    Tesla.options(client, url, opts)
  end

  def options!(%Conn{} = conn, url, opts \\ []) do
    client = new(conn)
    Tesla.options!(client, url, opts)
  end

  def trace(%Conn{} = conn, url, opts \\ []) do
    client = new(conn)
    Tesla.trace(client, url, opts)
  end

  def trace!(%Conn{} = conn, url, opts \\ []) do
    client = new(conn)
    Tesla.trace!(client, url, opts)
  end

  def patch(%Conn{} = conn, url, body, opts \\ []) do
    client = new(conn)
    Tesla.patch(client, url, body, opts)
  end

  def patch!(%Conn{} = conn, url, body, opts \\ []) do
    client = new(conn)
    Tesla.patch!(client, url, body, opts)
  end

  def post(%Conn{} = conn, url, body, opts \\ []) do
    client = new(conn)
    Tesla.post(client, url, body, opts)
  end

  def post!(%Conn{} = conn, url, body, opts \\ []) do
    client = new(conn)
    Tesla.post!(client, url, body, opts)
  end

  def put(%Conn{} = conn, url, body, opts \\ []) do
    client = new(conn)
    Tesla.put(client, url, body, opts)
  end

  def put!(%Conn{} = conn, url, body, opts \\ []) do
    client = new(conn)
    Tesla.put!(client, url, body, opts)
  end

  def request(%Conn{} = conn, opts \\ []) do
    client = new(conn)
    Tesla.request(client, opts)
  end

  def request!(%Conn{} = conn, opts \\ []) do
    client = new(conn)
    Tesla.request!(client, opts)
  end
end
