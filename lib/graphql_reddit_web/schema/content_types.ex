defmodule GraphqlRedditWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :post do
    field :permalink, :string, resolve: key("permalink")
    field :selftext, :string, resolve: key("selftext")
    field :subreddit, :string, resolve: key("subreddit")
    field :thumbnail, :string, resolve: key("thumbnail")
    field :title, :string, resolve: key("title")
    field :url, :string, resolve: key("url")
  end

  # Since the Map that we're resolving has string keys,
  # we need to do an extra step here because otherwise it will just
  # look for them by atom.
  defp key(field_name) do
    fn entity, _, _ ->
      {:ok, Map.get(entity, field_name)}
    end
  end
end
