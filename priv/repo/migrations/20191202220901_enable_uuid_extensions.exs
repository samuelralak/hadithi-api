defmodule HadithiApi.Repo.Migrations.EnableUuidExtensions do
  use Ecto.Migration

  def up do
    execute "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\" WITH SCHEMA public;"
    execute "CREATE EXTENSION IF NOT EXISTS \"pgcrypto\" WITH SCHEMA public;"
  end

  def down do
    execute "DROP EXTENSION \"uuid-ossp\";"
    execute "DROP EXTENSION \"pgcrypto\";"
  end
end
