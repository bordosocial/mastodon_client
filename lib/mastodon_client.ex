defmodule MastodonClient do
  alias MastodonClient.Conn

  def new(%Conn{} = conn) do
    middleware = [
      {Tesla.Middleware.Headers, [{"Content-Type", "application/json"}]},
      {Tesla.Middleware.BaseUrl, conn.instance},
      Tesla.Middleware.JSON
    ]

    middleware =
      if conn.access_token do
        [
          {Tesla.Middleware.Headers, [{"Authorization", "Bearer #{conn.access_token}"}]}
          | middleware
        ]
      else
        middleware
      end

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
