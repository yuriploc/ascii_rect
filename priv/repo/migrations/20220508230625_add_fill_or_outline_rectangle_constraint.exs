defmodule AsciiRect.Repo.Migrations.AddFillOrOutlineRectangleConstraint do
  use Ecto.Migration

  def up do
    create(
      constraint(
        :rectangles,
        :at_least_fill_or_outline,
        check: "((fill IS NOT NULL)::integer + (outline IS NOT NULL)::integer) > 0"
      )
    )
  end

  def down do
    drop(constraint(:rectangles, :at_least_fill_or_outline))
  end
end
