defmodule HadithiApi.Auth.ErrorHandler do
  @moduledoc false

  @behaviour Guardian.Plug.ErrorHandler

  import Plug.Conn

  @doc false
  def auth_error(conn, {:unauthorized, :unauthorized}, _opts) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(
      403,
      ~s({"error": {
          "status": "unauthorized",
          "reason": "user might not have the necessary permissions for the requested resource"
        }})
    )
  end

  def auth_error(conn, {type, _reason}, _opts) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(401, ~s({"error": {"status": "#{to_string(type)}"}}))
  end
end
