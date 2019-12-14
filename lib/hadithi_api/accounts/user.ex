defmodule HadithiApi.Accounts.User do
  use HadithiApi.Schema
  import Ecto.Changeset

  alias __MODULE__
  alias HadithiApi.Ecto.PasswordHash

  schema "users" do
    field :email, :string
    field :name, :string
    field :timezone, :string
    field :has_completed_profile, :boolean
    field :has_connected_twitter, :boolean
    field :password, PasswordHash

    timestamps()
  end

  @doc false
  def changeset(%User{id: id} = user, attrs) when not is_nil(id) do
    user
    |> cast(attrs, [:email, :name, :password, :timezone])
    |> validate_required([:email, :password, :name, :timezone])
    |> unique_constraint(:email, name: :users_email_index)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name, :password, :timezone])
    |> unique_constraint(:email, name: :users_email_index)
  end
end
