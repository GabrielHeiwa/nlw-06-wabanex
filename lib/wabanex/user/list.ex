defmodule Wabanex.Users.List do
  alias Wabanex.{Repo, Users}

  def call() do
    Repo.all(Users)
  end
end
