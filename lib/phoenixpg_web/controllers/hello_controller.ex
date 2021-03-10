defmodule PhoenixpgWeb.HelloController do
  use PhoenixpgWeb, :controller

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    conn
    |> put_flash(:info, "Hi There")
    |> render("index.html")
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"messenger" => messenger}) do
    json(conn, %{who_this_nigga: messenger})
  end
end
