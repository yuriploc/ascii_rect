# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AsciiRect.Repo.insert!(%AsciiRect.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import AsciiRect.Factory

canvases = insert_list(Enum.random(1..10), :canvas)
canvas_ids = Enum.map(canvases, & &1.id)

rectangles = length(canvases) + 2

insert_list(rectangles, :rectangle, canvas_id: Enum.random(canvas_ids))
