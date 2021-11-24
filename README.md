# MastodonClient

Lightweight Elixir HTTP client for [Mastodon](https://joinmastodon.org/) and [Pleroma](https://pleroma.social/) based on [Tesla](https://github.com/teamon/tesla).

## Installation

Add `mastodon_client`, a JSON parser, and an HTTP client to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mastodon_client, "~> 0.1.0"},

    # Tesla-compatible HTTP client
    {:hackney, "~> 1.18"},

    # Any Tesla-compatible JSON parser
    {:jason, "~> 1.2"}
  ]
end
```

Tesla's default HTTP adapter is insecure, so you need to configure it to Hackney or something else in `config/config.exs`:

```elixir
config :tesla, adapter: Tesla.Adapter.Hackney
```

## Usage

Construct a `%MastodonClient.Conn{}` and pass it to the HTTP functions:

```elixir
conn =
  %MastodonClient.Conn{
    instance: "https://gleasonator.com",
    access_token: "OkgdLaYHU8A6Dc70eW7gSfBQzPFpwWI6UfHg2F2zQdM"
  }

MastodonClient.get(conn, "/api/v1/instance")
MastodonClient.get(conn, "/api/v1/accounts/verify_credentials")
MastodonClient.post(conn, "/api/v1/statuses", %{status: "Hello world!"})
```

That's it.
It's a simple wrapper around Tesla and returns a `%Tesla.Env{}` struct.

# License

mastodon_client is licensed under the MIT license.
See LICENSE.md for the full text.
