defmodule ParkApi.ParkView do
  use ParkApi.Web, :view

  def render("index.json", %{parks: parks}) do
    %{data: render_many(parks, ParkApi.ParkView, "park.json")}
  end

  def render("show.json", %{park: park}) do
    %{data: render_one(park, ParkApi.ParkView, "park.json")}
  end

  def render("park.json", %{park: park}) do
    %{id: park.id,
      name: park.name,
      description: park.description,
      lat: park.lat,
      lng: park.lng,
      active: park.active,
      images: park.images}
  end
end
