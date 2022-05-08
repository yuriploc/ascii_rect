defmodule AsciiRect.Repo.Migrations.CreateRectanglesTable do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:rectangles) do
      add(:fill, :string)
      add(:height, :integer, null: false)
      add(:outline, :string)
      add(:width, :integer, null: false)
      add(:x, :integer, null: false)
      add(:y, :integer, null: false)
      add(:canvas_id, references(:canvases, column: :id, on_delete: :delete_all))

      timestamps()
    end
  end
end
