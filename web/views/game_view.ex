defmodule ParkApi.GameView do
  use ParkApi.Web, :view

  def render("index.json", %{games: games}) do
    %{data: render_many(games, ParkApi.GameView, "game.json")}
  end

  def render("show.json", %{game: game}) do
    %{data: render_one(game, ParkApi.GameView, "game.json")}
  end

  def render("game.json", %{game: game}) do
    %{id: game.id,
      name: game.name,
      description: game.description,
      active: game.active,
      images: game.images}
  end
end
