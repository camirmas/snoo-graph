defmodule GraphqlRedditWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  import GraphqlRedditWeb.Schema.Utils

  object :user do
    field :icon_img, :string, resolve: key("icon_img")
    field :name, :string, resolve: key("name")
  end
end
