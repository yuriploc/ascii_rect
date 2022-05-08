defmodule AsciiRect.Canvases.Rectangle do
  @moduledoc """
  A rectangle record to be used by each drawing operation.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias AsciiRect.Canvases.Canvas

  @required [:height, :width, :x, :y]
  @optional [:canvas_id, :fill, :outline]

  schema "rectangles" do
    field(:fill, :string)
    field(:height, :integer)
    field(:outline, :string)
    field(:width, :integer)
    field(:x, :integer)
    field(:y, :integer)

    belongs_to(:canvas, Canvas, foreign_key: :canvas_id, references: :id)

    timestamps()
  end

  def changeset(%__MODULE__{} = rectangle, attrs) do
    rectangle
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> validate_length(:fill, max: 1, message: "fill can't have more than one character.")
    |> validate_length(:outline, max: 1, message: "outline can't have more than one character.")
    |> validate_number(:width,
      less_than_or_equal_to: 200,
      message: "width can't be greater than 200."
    )
    |> validate_number(:width, greater_than_or_equal_to: 1, message: "width can't be less than 1.")
    |> validate_number(:height,
      less_than_or_equal_to: 100,
      message: "height can't be greater than 100."
    )
    |> validate_number(:height,
      greater_than_or_equal_to: 1,
      message: "height can't be less than 1."
    )
    |> validate_number(:x, less_than_or_equal_to: 199, message: "x can't be greater than 199.")
    |> validate_number(:x, greater_than_or_equal_to: 0, message: "x can't be less than 0.")
    |> validate_number(:y, less_than_or_equal_to: 99, message: "y can't be greater than 99.")
    |> validate_number(:y, greater_than_or_equal_to: 0, message: "y can't be less than 0.")

    # TODO
    # |> validate_unique_fill_or_outline()
  end
end
