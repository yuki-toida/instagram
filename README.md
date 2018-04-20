# Instagram
simple HTTP client for [Instagram](https://www.instagram.com/developer/).

## Installation
```elixir
def deps do
  [
    {:instagram, "~> 0.1.0"}
  ]
end
```

## Configuration
```elixir
use Mix.Config

config :instagram,
  client_id: 999999999,
  client_secret: "YOUR CLIENT SECRET",
  redirect_uri: ""
```

client_secret: you can use environment variables.

```bash
export CLIENT_SECRET="YOUR CLIENT SECRET"
```

## License
MIT