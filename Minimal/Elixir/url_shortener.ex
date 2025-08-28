defmodule URLShortener do
  use GenServer

  # Client API
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, %{}, opts)
  end

  def shorten(pid, url) do
    GenServer.call(pid, {:shorten, url})
  end

  def get_url(pid, short) do
    GenServer.call(pid, {:get_url, short})
  end

  # Server callbacks
  def init(_) do
    {:ok, %{}}
  end

  def handle_call({:shorten, url}, _from, urls) do
    short = generate_short_code(6)
    new_urls = Map.put(urls, short, url)
    {:reply, short, new_urls}
  end

  def handle_call({:get_url, short}, _from, urls) do
    result = Map.get(urls, short)
    {:reply, result, urls}
  end

  # Private functions
  defp generate_short_code(length) do
    characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    char_list = String.graphemes(characters)
    
    1..length
    |> Enum.map(fn _ -> Enum.random(char_list) end)
    |> Enum.join()
  end
end

# Example usage
defmodule Example do
  def run do
    {:ok, pid} = URLShortener.start_link()
    short = URLShortener.shorten(pid, "https://www.example.com")
    IO.puts("Short URL: #{short}")
    
    case URLShortener.get_url(pid, short) do
      nil -> IO.puts("URL not found")
      original -> IO.puts("Original URL: #{original}")
    end
  end
end

# Run example
Example.run()
