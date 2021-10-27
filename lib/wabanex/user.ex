defmodule Wabanex.Users do
  @moduledoc """
  Wabanex.User

  file the schema user in the database
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key { :id, :binary_id, autogenerate: true}
  @fields [:email, :password, :name]

  schema "users" do
    field :email, :string
    field :password, :string
    field :name, :string

    timestamps()
  end

  def changeset (params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
