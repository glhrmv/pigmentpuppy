defmodule Pigmentpuppy.Colours do
  use Vivid
  alias Vivid.PNG

  def random_colour do
    [:rand.uniform(), :rand.uniform(), :rand.uniform()]
  end

  def draw_random([r, g, b]) do
    frame = Frame.init(100, 75)
    box = Box.init(Point.init(0, 0), Point.init(100, 75), true)
    
    frame
    |> Frame.push(box, RGBA.init(r, g, b))
    |> PNG.to_png("example.png")
  end
end
