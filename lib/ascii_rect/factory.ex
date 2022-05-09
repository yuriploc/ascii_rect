defmodule AsciiRect.Factory do
  use ExMachina.Ecto, repo: AsciiRect.Repo

  alias AsciiRect.Canvases.{Canvas, Rectangle}

  def rectangle_factory do
    %Rectangle{
      fill: "",
      height: Enum.random(1..100),
      outline: "",
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
