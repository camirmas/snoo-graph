defmodule GraphqlRedditWeb.Schema.Utils do
  # Since the Map that we're resolving has string keys,
  # we need to do an extra step here because otherwise it will just
  # look for them by atom.
  def key(field_name) do
    fn entity, _, _ ->
      {:ok, Map.get(entity, field_name)}
    end
  end
end
