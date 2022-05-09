defmodule AsciiRect.Canvases do
  @moduledoc """
  The Canvas context. Draws rectangles and persist canvas.
  """

  import Ecto.Query
  alias AsciiRect.Canvases.{Canvas, Rectangle}
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

  def get_rectangle() do
    :ok
  end
end
