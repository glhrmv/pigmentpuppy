defmodule Pigmentpuppy.Periodically do
  use GenServer

  alias Pigmentpuppy.Colours
  alias Pigmentpuppy.Utils

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work() # Schedule work to be performed at some point
    {:ok, state}
  end

  def handle_info(:work, state) do
    IO.puts "tweeting..."
    tweet_random_colour()
    IO.puts "tweeted!"

    schedule_work() # Reschedule once more

    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 1 * 60 * 60 * 1000) # Every hour
  end

  def tweet_random_colour do
    colour = Colours.random_colour()

    Colours.draw_random(colour)

    image = File.read!("example.png")
    ExTwitter.update_with_media(Utils.rgb_to_hex(colour), image)
  end
end
