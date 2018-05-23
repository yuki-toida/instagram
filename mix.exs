defmodule Instagram.MixProject do
  use Mix.Project

  @description """
  simple HTTP client for Instagram
  """

  def project do
    [
      app: :instagram,
      version: "0.2.0",
      elixir: "~> 1.6",
      name: "Instagram",
      description: @description,
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.18", only: :dev},
      {:httpoison, "~> 0.11"},
      {:poison, "~> 3.1"}
    ]
  end

  def package do
    [
      maintainers: ["yuki-toida"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/yuki-toida/instagram"}
    ]    
  end

end