defmodule GraphqlRedditWeb.Content do
  @base_url "https://www.reddit.com"

  def list_posts(subreddit) do
    subreddit
    |> subreddit_url()
    |> request()
    |> Poison.decode!()
    |> Kernel.get_in(["data", "children"])
    |> Enum.map(fn post -> post["data"] end)
  end

  defp request(url) do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)

    body
  end

  defp subreddit_url(subreddit) do
    "#{@base_url}/r/#{subreddit}.json"
  end
end
