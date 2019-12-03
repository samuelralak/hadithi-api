defmodule HadithiApi.Accounts do
  @moduledoc """
  Accounts context
  """

  alias HadithiApi.Accounts.User
  alias HadithiApi.Accounts.SignUp
  alias HadithiApi.Repo

  def sign_up(user_params) do
    changeset = sign_up_changeset(user_params)

    if changeset.valid? do
      user_attrs = Map.take(changeset.changes, [:email, :password])

      User
      |> Kernel.struct(user_attrs)
      |> Repo.insert()
    else
      {:error, changeset}
    end
  end

  defp sign_up_changeset(params) do
    SignUp.changeset(%SignUp{}, params)
  end
end
