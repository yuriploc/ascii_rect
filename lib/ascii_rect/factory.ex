defmodule AsciiRect.Factory do
  use ExMachina.Ecto, repo: AsciiRect.Repo

  alias AsciiRect.Canvases.{Canvas, Rectangle}

  def rectangle_factory do
    fill =
      0..1
      |> Enum.random()
      |> Faker.Lorem.characters()
      |> to_string()

    outline =
      1
      |> Faker.Lorem.characters()
      |> to_string()

    %Rectangle{
      fill: fill,
      height: Enum.random(1..100),
      outline: outline,
      width: Enum.random(1..200),
      x: Enum.random(0..199),
      y: Enum.random(0..99)
    }
  end

  def canvas_factory do
    %Canvas{
      external_uuid: UUID.uuid4()
    }
  end
end
