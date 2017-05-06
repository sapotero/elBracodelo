defmodule Web.ReportTest do
  use Web.ModelCase

  alias Web.Report

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Report.changeset(%Report{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Report.changeset(%Report{}, @invalid_attrs)
    refute changeset.valid?
  end
end
