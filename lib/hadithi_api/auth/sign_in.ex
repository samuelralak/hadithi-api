defmodule HadithiApi.Auth.SignIn do
  @moduledoc """
  Hadithi API Sign in schema
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field(:email, :string)
    field(:password, :string)
  end

  @permitted [:email, :password]

  @doc false
  def changeset(signin, attrs) do
    signin
    |> cast(attrs, @permitted)
    |> validate_required(@permitted)
    |> validate_length(:password, min: 4, max: 256)
  end
end
