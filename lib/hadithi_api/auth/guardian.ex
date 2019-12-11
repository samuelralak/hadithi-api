defmodule HadithiApi.Auth.Guardian do
  use Guardian, otp_app: :hadithi_api

  ## Guardian callbacks

  @impl true
  def subject_for_token(user, _claims) do
    sub =
      user
      |> Map.from_struct()
      |> Map.take([:id, :email, :name])
      |> Jason.encode!()

    {:ok, sub}
  end

  @impl true
  def resource_from_claims(%{"sub" => encoded_user}) do
    user_params =
      encoded_user
      |> Base.decode64!()
      |> :erlang.binary_to_term()

    {:ok, user_params}
  end

  @impl true
  def resource_from_claims(_claims) do
    {:error, :resource_not_found}
  end

  #   @impl true
  #   def build_claims(claims, %User{type: type}, _opts) do
  #     encoded_perms = User.encoded_permissions(type)
  #     {:ok, Map.put(claims, "pem", encoded_perms)}
  #   end
end
