defmodule AsciiRect.Canvases.Canvas do
  @moduledoc """
  A Canva record to draw rectangles.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias AsciiRect.Canvases.Rectangle

  @optional [:external_uuid]

  schema "canvases" do
    field(:external_uuid, :binary_id)
    has_many(:rectangles, Rectangle, foreign_key: :canvas_id)

    timestamps()
  end

  def changeset(%__MODULE__{} = canvas, attrs) do
    canvas
    |> cast(attrs, @optional)
    |> cast_assoc(:rectangles)
  end

  def creation_changeset(%__MODULE__{} = canvas, attrs) do
    changeset(canvas, attrs)
    |> generate_uuid()
  end

  defp generate_uuid(changeset) do
    if changeset.valid? && is_nil(get_change(changeset, :external_uuid)) do
      put_change(changeset, :external_uuid, UUID.uuid4())
    else
      changeset
    end
  end
end
