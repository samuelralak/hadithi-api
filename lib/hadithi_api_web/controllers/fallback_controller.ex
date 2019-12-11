defmodule HadithiApiWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use HadithiApiWeb, :controller

  @doc false
  def call(conn, {:error, _, %Ecto.Changeset{} = changeset, %{}}) do
    unprocessable_entity(conn, changeset)
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    unprocessable_entity(conn, changeset)
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(HadithiApiWeb.ErrorView)
    |> render(:"401")
  end

  def call(conn, {:error, :forbidden}) do
    conn
    |> put_status(:forbidden)
    |> put_view(HadithiApiWeb.ErrorView)
    |> render(:"403")
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(HadithiApiWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, {:badrpc, %RuntimeError{message: message}}}) do
    call(conn, {:error, String.to_atom(message)})
  end

  def call(conn, {:error, {:badrpc, reason}}) do
    service_unavailable(conn, reason)
  end

  def call(conn, {:error, reason}) do
    service_unavailable(conn, reason)
  end

  ## Private Functions

  defp unprocessable_entity(conn, changeset) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(HadithiApiWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  defp service_unavailable(conn, %{__struct__: exception, message: message}) do
    service_unavailable(conn, %{exception: exception, message: message})
  end

  defp service_unavailable(conn, _error) do
    conn
    |> put_status(503)
    |> put_view(HadithiApiWeb.ErrorView)
    |> render(:"503")
  end
end
