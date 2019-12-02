defmodule HadithiApi.Ecto.PasswordHash do
  @moduledoc """
  Custom password hash ecto type
  """

  use Ecto.Type

  ## Ecto.Type Callbacks

  @impl true
  def type, do: :hashed_string

  @impl true
  def cast(value) do
    {:ok, to_string(value)}
  end

  @impl true
  def dump(value) do
    data =
      value
      |> to_string()
      |> Argon2.hash_pwd_salt()

    {:ok, data}
  end

  @impl true
  def load(value) do
    {:ok, value}
  end

  ## Helpers

  defdelegate verify(string, hash), to: Argon2, as: :verify_pass
end
