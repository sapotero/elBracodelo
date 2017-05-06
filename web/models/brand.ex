defmodule Web.Brand do
  use Web.Web, :model

@derive {Poison.Encoder, only: [:id, :name]}
  schema "Brand" do
    field :name, :string
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
