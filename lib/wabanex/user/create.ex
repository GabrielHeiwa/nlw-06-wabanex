defmodule Wabanex.Users.Create do
  alias Wabanex.{Repo, Users}

  def call(params) do

    params
    |> Users.changeset()
    |> Repo.insert()

  end
end
