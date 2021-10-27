defmodule Wabanex.Users.Get do
  alias Ecto.UUID
  alias Wabanex.{Repo, Users}

  def call(uuid) do
    uuid
    |> UUID.cast()
    |> handle_response()
  end

  defp handle_response(:error), do: {:error, "UUID is not valid!"}

  defp handle_response({:ok, uuid}) do
    case Repo.get!(Users, uuid) do
      nil -> {:error, "User is not found!"}
      user -> user
    end
  end
end
