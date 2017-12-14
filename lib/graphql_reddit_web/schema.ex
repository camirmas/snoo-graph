defmodule GraphqlRedditWeb.Schema do
  use Absinthe.Schema

  alias GraphqlRedditWeb.Resolvers

  import_types GraphqlRedditWeb.Schema.ContentTypes
  import_types GraphqlRedditWeb.Schema.AccountTypes

  query do
    @desc "Get posts for a subreddit"
    field :posts, list_of(:post) do
      arg :sub, non_null(:string)
      resolve &Resolvers.Content.list_posts/3
    end

    @desc "Get a user's info by username"
    field :user, :user do
      arg :username, non_null(:string)
      resolve &Resolvers.Accounts.get_user/3
    end

    @desc "Get comments for a post"
    field :comments, list_of(:comment) do
      arg :sub, non_null(:string)
      arg :post, non_null(:string)
      resolve &Resolvers.Content.list_comments/3
    end
  end
end
