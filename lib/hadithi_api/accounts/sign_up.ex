defmodule HadithiApi.Accounts.SignUp do
  @moduledoc """
  User sign up embedded schema 
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :email, :string
    field :password, :string
    field :password_confirmation, :string
  end

  @permitted [:email, :password, :password_confirmation]

  def changeset(signup, attrs) do
    signup
    |> cast(attrs, @permitted)
    |> validate_required(@permitted)
    |> validate_confirmation(:password, message: "does not match password!")
  end
end
