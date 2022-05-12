defmodule AsciiRectWeb.CanvasController do
  use AsciiRectWeb, :controller

  alias AsciiRect.Canvases

  @spec init(any) :: map
  def init(options), do: options

  @spec get(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def get(conn, %{"canvas_uuid" => canvas_uuid}) do
    # wishlist: could create a is_uuid guard

    case Canvases.get_canvas(canvas_uuid) do
      {:ok, canvas} ->
        IO.inspect(canvas)
        json(conn, canvas)

      {:error, :not_found} ->
        conn
        |> put_status(404)
        |> json(%{})
    end
  end
end
