defmodule Web.User do
  use Web.Web, :model

@derive {Poison.Encoder, only: [:id, :role, :name]}
  schema "User" do
    field :name, :string
    field :role, :string
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :role])
    |> validate_required([:name, :role])
  end
end
