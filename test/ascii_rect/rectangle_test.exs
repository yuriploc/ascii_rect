defmodule AsciiRect.RectangleTest do
  use AsciiRect.DataCase

  alias AsciiRect.Canvases.Rectangle
  alias AsciiRect.Factory

  describe "changeset/2" do
    test "should create a valid changeset" do
      ch = Rectangle.changeset(%Rectangle{}, %{x: 1, y: 2, width: 50, height: 10, fill: "X"})

      assert ch.valid?
    end

    test "should return invalid changeset when fill has more than one character" do
      ch = Rectangle.changeset(%Rectangle{}, %{x: 1, y: 2, width: 50, height: 10, fill: "XZ"})

      refute ch.valid?
      assert %{fill: ["fill can't have more than one character."]} = errors_on(ch)
    end

    test "should return invalid changeset when outline has more than one character" do
      ch = Rectangle.changeset(%Rectangle{}, %{x: 1, y: 2, width: 50, height: 10, outline: "XZ"})

      refute ch.valid?
      assert %{outline: ["outline can't have more than one character."]} = errors_on(ch)
    end

    test "should return invalid changeset when 1 >= width >= 200" do
      ch = Rectangle.changeset(%Rectangle{}, %{x: 1, y: 2, width: 201, height: 10, outline: "X"})

      refute ch.valid?
      assert %{width: ["width can't be greater than 200."]} = errors_on(ch)

      ch = Rectangle.changeset(%Rectangle{}, %{x: 1, y: 2, width: 0, height: 10, outline: "X"})

      refute ch.valid?
      assert %{width: ["width can't be less than 1."]} = errors_on(ch)
    end

    test "should return invalid changeset when 1 >= height >= 100" do
      ch = Rectangle.changeset(%Rectangle{}, %{x: 1, y: 2, width: 200, height: 101, outline: "X"})

      refute ch.valid?
      assert %{height: ["height can't be greater than 100."]} = errors_on(ch)

      ch = Rectangle.changeset(%Rectangle{}, %{x: 1, y: 2, width: 1, height: 0, outline: "X"})

      refute ch.valid?
      assert %{height: ["height can't be less than 1."]} = errors_on(ch)
    end

    test "should return invalid changeset when 0 >= x >= 199" do
      ch =
        Rectangle.changeset(%Rectangle{}, %{x: 200, y: 2, width: 200, height: 100, outline: "X"})

      refute ch.valid?
      assert %{x: ["x can't be greater than 199."]} = errors_on(ch)

      ch = Rectangle.changeset(%Rectangle{}, %{x: -1, y: 2, width: 1, height: 1, outline: "X"})

      refute ch.valid?
      assert %{x: ["x can't be less than 0."]} = errors_on(ch)
    end

    test "should return invalid changeset when 0 >= y >= 99" do
      ch =
        Rectangle.changeset(%Rectangle{}, %{x: 199, y: 100, width: 200, height: 100, outline: "X"})

      refute ch.valid?
      assert %{y: ["y can't be greater than 99."]} = errors_on(ch)

      ch = Rectangle.changeset(%Rectangle{}, %{x: 1, y: -1, width: 1, height: 1, outline: "X"})

      refute ch.valid?
      assert %{y: ["y can't be less than 0."]} = errors_on(ch)
    end
  end
end
