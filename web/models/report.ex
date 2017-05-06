defmodule Web.Report do
  use Web.Web, :model

  @derive {Poison.Encoder, only: [:id, :dealer_id, :field_id]}
  schema "Report" do
    belongs_to :dealer, Web.Dealer
    belongs_to :field, Web.Field
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
