defmodule Web.Dealer do
  use Web.Web, :model

    @derive {Poison.Encoder, only: [:id, :name]}
  schema "Dealer" do
    field :name, :string
    belongs_to :brand, Web.Brand
    belongs_to :user,  Web.User
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> cast_assoc(:brand, required: true)
    |> cast_assoc(:user,  required: true)
  end
end
