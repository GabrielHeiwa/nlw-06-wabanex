defmodule Wabanex.Repo do
  @moduledoc """
  file of configuration the Ecto.Repo for
  database manipulation
  """

  use Ecto.Repo,
    otp_app: :wabanex,
    adapter: Ecto.Adapters.Postgres
end
