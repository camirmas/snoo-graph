defmodule GraphqlRedditWeb.Resolvers.Accounts do
  def get_user(%{ "author" => user }, _args, _resolution) do
    {:ok, GraphqlRedditWeb.Accounts.get_user(user)}
  end

  def get_user(_parent, %{ username: user }, _resolution) do
    {:ok, GraphqlRedditWeb.Accounts.get_user(user)}
  end
end
