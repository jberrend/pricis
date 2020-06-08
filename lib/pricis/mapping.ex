defmodule Pricis.Mapping do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mappings" do
    field :token, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(mapping, attrs \\ %{}) do
    mapping
    |> cast(attrs, [:url, :token])
    |> validate_required([:url, :token])
    |> unique_constraint(:token)
  end
end
