defmodule Phoenixpg.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :email])
    |> validate_required([:name, :username, :email])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_format(
      :email,
      ~r/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    )
    |> validate_length(:username, min: 2)
    |> validate_length(:username, max: 15)
  end
end
