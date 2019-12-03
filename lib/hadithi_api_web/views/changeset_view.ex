defmodule HadithiApiWeb.ChangesetView do
  use HadithiApiWeb, :view

  alias Ecto.Changeset

  @doc """
  Traverses and translates changeset errors.

  See `Ecto.Changeset.traverse_errors/2` and
  `HadithiApiWeb.ErrorHelpers.translate_error/1` for more details.
  """
  def translate_errors(changeset) do
    Changeset.traverse_errors(changeset, &translate_error/1)
  end

  @doc false
  def render("error.json", %{changeset: changeset}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    %{errors: translate_errors(changeset)}
  end
end
