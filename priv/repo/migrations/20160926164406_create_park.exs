defmodule ParkApi.Repo.Migrations.CreatePark do
  use Ecto.Migration

  def change do
    create table(:parks) do
      add :name, :string
      add :description, :string
      add :lat, :float
      add :lng, :float
      add :active, :boolean, default: false, null: false
      add :images, {:array, :string}

      timestamps()
    end

  end
end
