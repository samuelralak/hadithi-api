defmodule HadithiApi.Auth.Pipeline do
  @moduledoc false

  use Guardian.Plug.Pipeline,
    otp_app: :hadith_api,
    error_handler: HadithiApi.Auth.ErrorHandler,
    module: HadithiApi.Auth.Guardian

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
end
