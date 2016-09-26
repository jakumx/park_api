defmodule ParkApi.ParkControllerTest do
  use ParkApi.ConnCase

  alias ParkApi.Park
  @valid_attrs %{active: true, description: "some content", images: [], lat: "120.5", lng: "120.5", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, park_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    park = Repo.insert! %Park{}
    conn = get conn, park_path(conn, :show, park)
    assert json_response(conn, 200)["data"] == %{"id" => park.id,
      "name" => park.name,
      "description" => park.description,
      "lat" => park.lat,
      "lng" => park.lng,
      "active" => park.active,
      "images" => park.images}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, park_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, park_path(conn, :create), park: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Park, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, park_path(conn, :create), park: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    park = Repo.insert! %Park{}
    conn = put conn, park_path(conn, :update, park), park: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Park, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    park = Repo.insert! %Park{}
    conn = put conn, park_path(conn, :update, park), park: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    park = Repo.insert! %Park{}
    conn = delete conn, park_path(conn, :delete, park)
    assert response(conn, 204)
    refute Repo.get(Park, park.id)
  end
end
