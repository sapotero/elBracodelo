defmodule Web.DealerTest do
  use Web.ModelCase

  alias Web.Dealer

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Dealer.changeset(%Dealer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Dealer.changeset(%Dealer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
