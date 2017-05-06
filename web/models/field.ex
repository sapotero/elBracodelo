defmodule Web.Field do
  use Web.Web, :model

  @derive {Poison.Encoder, only: [:id, :name, :year, :value, :field_group, :field_type]}
  schema "Field" do
    field :name,  :string
    field :value, :integer
    field :year,  :integer
    belongs_to :field_type,  Web.FieldType
    belongs_to :field_group, Web.FieldGroup
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :value, :year])
    |> validate_required([:name, :value, :year])
  end
end
