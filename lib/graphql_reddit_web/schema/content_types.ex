defmodule GraphqlRedditWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  alias GraphqlRedditWeb.Resolvers
  import GraphqlRedditWeb.Schema.Utils

  object :post do
    field :author, :user, resolve: &Resolvers.Accounts.get_user/3
    field :permalink, :string, resolve: key("permalink")
    field :score, :string, resolve: key("score")
    field :selftext, :string, resolve: key("selftext")
    field :subreddit, :string, resolve: key("subreddit")
    field :thumbnail, :string, resolve: key("thumbnail")
    field :title, :string, resolve: key("title")
    field :url, :string, resolve: key("url")
  end
end
