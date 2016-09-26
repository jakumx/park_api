defmodule ParkApi.Park do
  use ParkApi.Web, :model

  schema "parks" do
    field :name, :string
    field :description, :string
    field :lat, :float
    field :lng, :float
    field :active, :boolean, default: false
    field :images, {:array, :string}

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :lat, :lng, :active, :images])
    |> validate_required([:name, :description, :lat, :lng, :active, :images])
  end
end
