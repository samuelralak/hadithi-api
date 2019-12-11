defmodule HadithiApi.Auth.Token do
  @moduledoc false

  defstruct [:access_token, :expires_in, :token_type, :scope]

  alias __MODULE__
  alias HadithiApi.Accounts.User
  alias HadithiApi.Auth.Guardian.Plug, as: SessionManager

  ## API

  @doc false
  def new(conn, %User{} = user, claims \\ %{}) do
    conn = SessionManager.sign_in(conn, user, claims)
    jwt = SessionManager.current_token(conn)
    claims = SessionManager.current_claims(conn)

    %Token{
      access_token: jwt,
      expires_in: expiry_time(claims["exp"]),
      token_type: "Bearer"
    }
  end

  ## Private Functions

  defp expiry_time(expire_at) do
    expire_at - DateTime.to_unix(DateTime.utc_now())
  end
end
