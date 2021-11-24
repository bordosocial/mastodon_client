defmodule MastodonClient.Conn do
  @moduledoc """
  A conn represents the connection to an instance.
  It's used by API functions to provide the instance URL and authentication.
  """
  defstruct instance: nil, access_token: nil

  @typedoc """
  Struct representing a connection to an instance.
  """
  @type t :: %__MODULE__{
          instance: String.t() | nil,
          access_token: String.t() | nil
        }
end
