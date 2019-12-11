defmodule HadithiApi.Accounts do
  @moduledoc """
  Accounts context
  """
  alias Ecto.Multi
  alias HadithiApi.Accounts.User
  alias HadithiApi.Accounts.SignUp
  alias HadithiApi.Repo

  def sign_up(user_params) do
    changeset = sign_up_changeset(user_params)

    if changeset.valid? do
      user_attrs = Map.take(changeset.changes, [:email, :password])

      Multi.new()
      |> Multi.insert(:user, user_changeset(user_attrs))
      |> Repo.transaction()
    else
      {:error, changeset}
    end
  end

  defp user_changeset(params) do
    User.changeset(%User{}, params)
  end

  defp sign_up_changeset(params) do
    SignUp.changeset(%SignUp{}, params)
  end
end
