defmodule DockerAPI.Misc do
  alias DockerAPI.Request, as: R

  def info(client) do
    R.get(client, "/info")
  end

  def version(client) do
    R.get(client, "/version")
  end

  def ping(client) do
    R.get(client, "/_ping")
  end

  # def build(_client), do: throw :not_implemented_yet
  # def auth(_client), do: throw :not_implemented_yet
  # def commit(_client), do: throw :not_implemented_yet
  # def events(_client), do: throw :not_implemented_yet
  # def get_image(_client, _image \\ :all), do: throw :not_implemented_yet
  # def load(_client), do: throw :not_implemented_yet
  #
  # def exec_create(_client), do: throw :not_implemented_yet
  # def exec_start(_client), do: throw :not_implemented_yet
  # def exec_resize(_client), do: throw :not_implemented_yet

end
