defmodule Instagram.Environment do

  def client_id do
    Application.fetch_env!(:instagram, :client_id)
  end
  
  def client_secret do
    Application.get_env(:instagram, :client_secret, System.get_env("CLIENT_SECRET"))
  end

  def redirect_uri do
    Application.fetch_env!(:instagram, :redirect_uri)
  end

end
