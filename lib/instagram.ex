defmodule Instagram do
  alias Instagram.Environment
  @endpoint "https://api.instagram.com"
  
  def login_url(state \\ nil) do
    "#{@endpoint}/oauth/authorize"
    <> "?client_id=#{Environment.client_id()}"
    <> "&redirect_uri=#{redirect_uri(state)}"
    <> "&response_type=code"
  end

  def redirect_uri(state) do
    case state do
      nil -> "#{Environment.redirect_uri()}"
      _ -> "#{Environment.redirect_uri()}?state=#{state}"
    end
  end
  
  def access_token(code, state \\ nil) do
    body = [
      client_id: Environment.client_id(),
      client_secret: Environment.client_secret(),
      grant_type: "authorization_code",
      redirect_uri: redirect_uri(state),
      code: code
    ]
    "#{@endpoint}/oauth/access_token"
    |> HTTPoison.post({:form, body}, [{"Content-Type", "application/x-www-form-urlencoded"}])
    |> decode()
  end

  def user(access_token) do
    "#{@endpoint}/v1/users/self/?access_token=#{access_token}"
    |> HTTPoison.get()
    |> decode()
  end

  defp decode(response) do
    case response do
      {:error, %HTTPoison.Error{reason: reason}} -> {:error, reason}
      {:ok, %HTTPoison.Response{body: body}} -> {:ok, Poison.decode!(body)}
    end
  end

end
