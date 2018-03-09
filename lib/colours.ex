defmodule Chromacat.Colours do
  use Vivid
  alias Vivid.PNG
  alias Chromacat.Utils
  
  defp draw_random([r, g, b]) do
    frame = Frame.init(400, 300)
    box = Box.init(Point.init(0, 0), Point.init(50, 50), true)
    
    frame
    |> Frame.push(box, RGBA.init(r, g, b))
    |> PNG.to_png("example.png")
  end
end
