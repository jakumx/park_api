defmodule ParkApi.PageController do
  use ParkApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
