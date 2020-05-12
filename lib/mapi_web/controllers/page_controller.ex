defmodule MapiWeb.PageController do
  use MapiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
