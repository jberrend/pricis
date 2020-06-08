defmodule PricisWeb.PageController do
  use PricisWeb, :controller
  alias Pricis.Mapping
  alias Pricis.TokenGenerator
  alias Pricis.Repo
  alias PricisWeb.Router.Helpers

  require Logger

  def index(conn, _params) do
    changeset = Mapping.changeset(%Mapping{})
    render(conn, "index.html", changeset: changeset)
  end

  def redirect_token(conn, %{"token" => token}) do
    case Repo.get_by(Mapping, token: token) do
      %Mapping{:url => url, :token => _} -> redirect(conn, external: url)
      nil ->
        conn
        |> put_flash(:error, "Cannot find mapping for provided link!")
        |> index(%{})
    end
  end

  def create_mapping(conn, %{"url" => url}) do
    token = TokenGenerator.generate_token()
    Logger.info("Generated token: #{token} for url: #{url}")
    changeset = Mapping.changeset(%Mapping{:url => url, :token => token})

    if changeset.valid? do
      Repo.insert(changeset)
    end

    path = Helpers.page_path(conn, :show_mapping, token)
    redirect(conn, to: path)
  end

  def show_mapping(conn, %{"token" => token}) do
    render(conn, "show_mapping.html", token: token)
  end

end
