defmodule GraphqlRedditWeb.Resolvers.Content do
  def list_posts(parent, %{ sub: subreddit }, resolution) do
    {:ok, GraphqlRedditWeb.Content.list_posts(subreddit)}
  end
end
