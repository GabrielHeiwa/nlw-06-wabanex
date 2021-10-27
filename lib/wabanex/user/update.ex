defmodule Wabanex.Users.Update do
  alias Ecto.Changeset
  alias Wabanex.{Repo, Users}

  def call(user_id, user_params) do
    user = Users.Get.call(user_id)
    user = Changeset.change user, user_params

    case Repo.update(user) do
      {:ok, _ } -> "Update user success"
      {:error, errors } -> "Update user failed: #{errors}"
    end

  end
end
