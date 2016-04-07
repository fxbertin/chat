defmodule Chat.PageController do
  use Chat.Web, :controller

  def index(conn, _params) do
    render conn, "canvas.html"
  end
end
