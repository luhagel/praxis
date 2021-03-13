defmodule Praxis.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :first_name, :string
      add :last_name, :string
      add :avatar_url, :string
      add :date_of_birth, :date

      timestamps()
    end
  end
end
