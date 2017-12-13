defmodule GraphqlRedditWeb.Router do
  use GraphqlRedditWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: GraphqlRedditWeb.Schema

    forward "/", Absinthe.Plug,
      schema: GraphqlRedditWeb.Schema
  end
end
