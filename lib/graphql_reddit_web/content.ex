defmodule GraphqlRedditWeb.Content do
  @base_url "https://www.reddit.com"

  def list_posts(subreddit) do
    subreddit
    |> request
    |> Poison.decode!
    |> Kernel.get_in(["data", "children"])
    |> Enum.map(fn post -> post["data"] end)
  end

  defp request(subreddit) do
    {:ok, %HTTPoison.Response{body: body}} =
      subreddit
      |> subreddit_url()
      |> HTTPoison.get()

    body
  end

  defp subreddit_url(subreddit) do
    "#{@base_url}/r/#{subreddit}.json"
  end
end
