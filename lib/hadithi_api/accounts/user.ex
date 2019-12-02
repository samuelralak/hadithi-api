defmodule HadithiApi.Accounts.User do
  use HadithiApi.Schema
  import Ecto.Changeset

  alias HadithiApi.Ecto.PasswordHash

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, PasswordHash

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name, :password])
    |> validate_required([:email, :name, :password])
  end
end
