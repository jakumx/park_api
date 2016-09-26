defmodule ParkApi.ParkController do
  use ParkApi.Web, :controller

  alias ParkApi.Park

  def index(conn, _params) do
    parks = Repo.all(Park)
    render(conn, "index.json", parks: parks)
  end

  def create(conn, %{"park" => park_params}) do
    changeset = Park.changeset(%Park{}, park_params)

    case Repo.insert(changeset) do
      {:ok, park} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", park_path(conn, :show, park))
        |> render("show.json", park: park)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ParkApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    park = Repo.get!(Park, id)
    render(conn, "show.json", park: park)
  end

  def update(conn, %{"id" => id, "park" => park_params}) do
    park = Repo.get!(Park, id)
    changeset = Park.changeset(park, park_params)

    case Repo.update(changeset) do
      {:ok, park} ->
        render(conn, "show.json", park: park)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ParkApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    park = Repo.get!(Park, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(park)

    send_resp(conn, :no_content, "")
  end
end
