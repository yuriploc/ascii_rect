defmodule AsciiRect.Factory do
  use ExMachina.Ecto, repo: AsciiRect.Repo

  alias AsciiRect.Canvases.{Canvas, Rectangle}

  def rectangle_factory do
    %Rectangle{
      fill: Faker.Lorem.characters(1),
      height: Enum.random(1..100),
      outline: Faker.Lorem.characters(1),
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
