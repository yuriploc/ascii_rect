defmodule AsciiRect.Repo.Migrations.CreateCanvasesTable do
  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS \"pgcrypto\";")

    create_if_not_exists table(:canvases) do
      add(:external_uuid, :binary_id, default: fragment("gen_random_uuid()"))

      timestamps()
    end

    create(index(:canvases, [:external_uuid]))
  end

  def down do
    drop_if_exists index(:canvases, [:external_uuid])
    drop_if_exists(:canvases)
  end
end
