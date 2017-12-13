defmodule GraphqlRedditWeb.Accounts do
  @base_url "https://www.reddit.com"

  def get_user(user) do
    user
    |> user_url()
    |> request()
    |> Poison.decode!
    |> Kernel.get_in(["data"])
  end

  defp request(url) do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)

    body
  end

  defp user_url(user) do
    "#{@base_url}/user/#{user}/about.json"
  end
end
