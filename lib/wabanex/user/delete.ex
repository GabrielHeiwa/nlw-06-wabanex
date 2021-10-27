defmodule Wabanex.Users.Delete do
  alias Ecto.UUID
  alias Wabanex.{Repo, Users.Get}

  def call(uuid) do
    uuid
    |> UUID.cast()
    |> handle_response()
  end

  defp handle_response(:error), do: {:error, "UUID is invalid!"}

  defp handle_response({:ok, uuid}) do
    user = Get.call(uuid)


    case Repo.delete(user) do
      {:ok, struct} -> {:ok, "User delete with success", struct}
      {:error, changeset} -> {:error, "Error in delete user operation", changeset}
    end
  end
end
