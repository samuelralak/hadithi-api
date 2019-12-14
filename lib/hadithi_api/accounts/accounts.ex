defmodule HadithiApi.Accounts do
  @moduledoc """
  Accounts context
  """
  alias Ecto.Multi
  alias HadithiApi.Accounts.User
  alias HadithiApi.Accounts.SignUp
  alias HadithiApi.Repo

  def get_user!(id), do: Repo.get!(User, id)

  def sign_up(user_params) do
    changeset = sign_up_changeset(user_params)

    if changeset.valid? do
      user_attrs = Map.take(changeset.changes, [:email, :password])

      Multi.new()
      |> Multi.insert(:user, change_user(%User{}, user_attrs))
      |> Repo.transaction()
    else
      {:error, changeset}
    end
  end

  def update_user(%User{} = user, attrs) do
    user
    |> change_user(attrs)
    |> Repo.update()
  end

  ## Private Functions

  defp change_user(user, params), do: User.changeset(user, params)

  defp sign_up_changeset(params) do
    SignUp.changeset(%SignUp{}, params)
  end
end
