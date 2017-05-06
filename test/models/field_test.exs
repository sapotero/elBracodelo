defmodule Web.FieldTest do
  use Web.ModelCase

  alias Web.Field

  @valid_attrs %{name: "some content", value: 42, year: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Field.changeset(%Field{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Field.changeset(%Field{}, @invalid_attrs)
    refute changeset.valid?
  end
end
