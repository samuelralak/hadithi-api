defmodule HadithiApi.Auth do
  @moduledoc """
  Auth context
  """

  import Ecto.Query, warn: false

  alias HadithiApi.Accounts.User
  alias HadithiApi.Auth.SignIn
  alias HadithiApi.Ecto.PasswordHash
  alias HadithiApi.Repo
  alias Ecto.Changeset

  def authenticate_user(user_params) do
    with %Changeset{changes: changes, valid?: true} <- SignIn.changeset(%SignIn{}, user_params) do
      User
      |> Repo.get_by(email: changes.email)
      |> validate_user_pass(changes)
    else
      changeset -> {:error, changeset}
    end
  end

  ## Private functions

  defp validate_user_pass(user, %{password: password}) do
    cond do
      user && PasswordHash.verify(password, user.password) -> {:ok, user}
      user -> {:error, :unauthorized}
      true -> {:error, :unauthorized}
    end
  end
end
