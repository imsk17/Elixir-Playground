defmodule PhoenixpgWeb.PageController do
  use PhoenixpgWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
