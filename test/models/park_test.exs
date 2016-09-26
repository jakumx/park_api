defmodule ParkApi.ParkTest do
  use ParkApi.ModelCase

  alias ParkApi.Park

  @valid_attrs %{active: true, description: "some content", images: [], lat: "120.5", lng: "120.5", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Park.changeset(%Park{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Park.changeset(%Park{}, @invalid_attrs)
    refute changeset.valid?
  end
end
