defmodule HadithiApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")
      add :email, :string
      add :name, :string
      add :timezone, :string
      add :has_completed_profile, :boolean, null: false, default: false
      add :has_connected_twitter, :boolean, null: false, default: false
      add :password, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
