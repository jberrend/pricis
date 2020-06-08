defmodule Pricis.Repo.Migrations.CreateMappings do
  use Ecto.Migration

  def change do
    create table(:mappings) do
      add :url, :string
      add :token, :string

      timestamps()
    end

  end
end
