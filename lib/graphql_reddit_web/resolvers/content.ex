defmodule GraphqlRedditWeb.Resolvers.Content do
  def list_posts(_parent, %{ sub: subreddit }, _resolution) do
    {:ok, GraphqlRedditWeb.Content.list_posts(subreddit)}
  end

  def list_comments(_parent, %{ sub: subreddit, post: post }, _resolution) do
    {:ok, GraphqlRedditWeb.Content.list_comments(subreddit, post)}
  end

  def list_comments(%{ "subreddit" => subreddit, "id" => post }, _args, _resolution) do
    {:ok, GraphqlRedditWeb.Content.list_comments(subreddit, post)}
  end
end
