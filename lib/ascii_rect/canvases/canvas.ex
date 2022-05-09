defmodule AsciiRect.Canvases.Canvas do
  @moduledoc """
  A Canvas record to draw rectangles.
  """
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias AsciiRect.Canvases.{Canvas, Rectangle}

  @type t :: %__MODULE__{}

  @optional [:external_uuid]

  @derive {Jason.Encoder, except: [:__meta__]}

  schema "canvases" do
    field(:external_uuid, :binary_id)
    has_many(:rectangles, Rectangle, foreign_key: :canvas_id, references: :id)

    timestamps()
  end

  @spec changeset(Canvas.t(), map()) :: Ecto.Changeset.t()
  def changeset(%Canvas{} = canvas, attrs) do
    canvas
    |> cast(attrs, @optional)
    |> cast_assoc(:rectangles)
  end

  @spec by_uuid(Ecto.Queryable.t(), UUID.t()) :: Ecto.Query.t()
  def by_uuid(query, uuid) do
    query
    |> where([canvas: c], c.external_uuid == ^uuid)
  end

  @spec with_rectangles(Ecto.Queryable.t()) :: Ecto.Query.t()
  def with_rectangles(query) do
    query
    |> join(:left, [canvas: c], r in assoc(c, :rectangles), as: :rectangle)
    |> preload([rectangle: r], rectangles: r)
  end
end
