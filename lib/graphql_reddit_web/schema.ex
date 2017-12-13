defmodule GraphqlRedditWeb.Schema do
  use Absinthe.Schema

  alias GraphqlRedditWeb.Resolvers

  import_types GraphqlRedditWeb.Schema.ContentTypes

  query do
    @desc "Get posts"
    field :posts, list_of(:post) do
      arg :sub, non_null(:string)
      resolve &Resolvers.Content.list_posts/3
    end
  end
end
