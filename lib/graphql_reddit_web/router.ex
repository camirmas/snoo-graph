defmodule GraphqlRedditWeb.Router do
  use GraphqlRedditWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GraphqlRedditWeb do
    pipe_through :api
  end
end
