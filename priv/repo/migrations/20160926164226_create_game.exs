defmodule ParkApi.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :name, :string
      add :description, :string
      add :active, :boolean, default: false, null: false
      add :images, {:array, :string}

      timestamps()
    end

  end
end
