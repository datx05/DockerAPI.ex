defmodule DockerAPI.Images do
  alias DockerAPI.Request, as: R

  @doc """
  List images
  """
  @spec list(DockerAPI.Client.t()) :: [map()] | no_return()
  def list(client) do
    R.get(client, "/images/json")
  end

  @doc """
  Returns whether an image exists
  """
  @spec exists(DockerAPI.Client.t(), String.t()) ::
          boolean() | no_return()
  def exists(client, tag) do
    images = R.get(client, "/images/json")
    Enum.find_value(images, false, fn %{"RepoTags" => repo_tags} -> tag in repo_tags end)
  end

  @doc """
  Create an image either by pulling it from the registry or by importing it
  """
  @spec create(map(), DockerAPI.Client.t()) :: Enumerable.t()
  def create(params, client) do
    R.stream_request(client, :post, "/images/create?" <> URI.encode_query(params))
  end

  @doc """
  Create an image by pulling it from the registry

  Same as doing create(%{fromImage: "image", tag: "tag"}, client)
  """
  @spec create(String.t(), String.t(), DockerAPI.Client.t()) :: Enumerable.t()
  def create(image, tag, client) do
    params = URI.encode_query(%{fromImage: image, tag: tag})
    R.stream_request(client, :post, "/images/create?" <> params)
  end

  # def inspect(_client), do: throw :not_implemented_yet
  # def history(_client), do: throw :not_implemented_yet
  # def push(_client), do: throw :not_implemented_yet
  # def tag(_client), do: throw :not_implemented_yet
  # def delete(_client), do: throw :not_implemented_yet
  # def search(_client), do: throw :not_implemented_yet
end
