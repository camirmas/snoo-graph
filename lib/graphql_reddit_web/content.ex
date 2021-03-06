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

  def list_comments(subreddit, post) do
    subreddit
    |> comments_url(post)
    |> request()
    |> Poison.decode!()
    |> Enum.at(1)
    |> Kernel.get_in(["data", "children"])
    |> Enum.map(fn comment -> comment["data"] end)
  end

  def list_replies(%{"replies" => ""}) do
    []
  end

  def list_replies(comment) do
    comment
    |> Kernel.get_in(["replies", "data", "children"])
    |> Enum.map(fn comment -> comment["data"] end)
  end

  defp request(url) do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)

    body
  end

  defp subreddit_url(subreddit) do
    "#{@base_url}/r/#{subreddit}.json"
  end

  defp comments_url(subreddit, post) do
    "#{@base_url}/r/#{subreddit}/comments/#{post}.json"
  end
end
