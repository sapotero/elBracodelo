defmodule Web.FieldGroupTest do
  use Web.ModelCase

  alias Web.FieldGroup

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = FieldGroup.changeset(%FieldGroup{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = FieldGroup.changeset(%FieldGroup{}, @invalid_attrs)
    refute changeset.valid?
  end
end
