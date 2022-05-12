defmodule AsciiRect.Canvases do
  @moduledoc """
  The Canvas context. Draws rectangles and persist canvas.
  """

  import Ecto.Query
  alias AsciiRect.Canvases.Canvas
  alias AsciiRect.Repo

  #####################
  ### Database getters

  @doc """
  Get Canvas with associated Rectangles preloaded.
  """
  @spec get_canvas(UUID.t()) :: {:ok, Canvas.t()} | {:error, :not_found}
  def get_canvas(uuid) do
    Canvas
    |> from(as: :canvas)
    |> Canvas.by_uuid(uuid)
    |> Canvas.with_rectangles()
    |> Repo.one()
    |> case do
      nil -> {:error, :not_found}
      canvas -> {:ok, canvas}
    end
  end

  @spec draw_canvas(Canvas.t()) :: String.t()
  def draw_canvas(%Canvas{} = _canvas) do
    # TODO: use changesets to get if the canvas is valid
    # also do it for the POST req to save canvas/rectangles
    "ok"
  end
end
