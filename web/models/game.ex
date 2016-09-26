defmodule ParkApi.Game do
  use ParkApi.Web, :model

  schema "games" do
    field :name, :string
    field :description, :string
    field :active, :boolean, default: false
    field :images, {:array, :string}

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :active, :images])
    |> validate_required([:name, :description, :active, :images])
  end
end
