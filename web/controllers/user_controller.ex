defmodule Web.UserController do
  use Web.Web, :controller

  alias Web.User
  alias Web.Dealer
  alias Web.Brand
  alias Web.FieldType
  alias Web.FieldGroup
  alias Web.Field
  alias Web.Report

  import Ecto.Query

    def index(conn, _params) do
    users = Repo.all(User)

    #    render(conn, "index.html", users: users)
    json(allow_cors(conn), Poison.encode! %{users: users} )
    end


    def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    #    render(conn, "show.html", user: user)
    json(allow_cors(conn), Poison.encode! %{user: user} )
    end


    def dealer(conn, %{"id" => id}) do
      dealer = Repo.get!(Dealer, id) |> Repo.preload(:brand)
      json(allow_cors(conn), Poison.encode! %{dealer: dealer} )
    end

    def all_dealer(conn, _params) do
      dealer = Repo.all(Dealer)
      json(allow_cors(conn), Poison.encode! %{dealers: dealer} )
    end


    def field_group(conn, _params) do
      groups = Repo.all(FieldType)
      json(allow_cors(conn), Poison.encode! %{groups: groups} )
    end

    def field_type(conn, _params) do
      types = Repo.all(FieldGroup)
      json(allow_cors(conn), Poison.encode! %{types: types} )
    end

    def fields(conn, _params) do
      groups = Repo.all(Field)  |> Repo.preload(:field_type) |> Repo.preload(:field_group)
      json(allow_cors(conn), Poison.encode! %{fields: groups} )
    end

    def reports(conn, %{"id" => id}) do
      reports = Repo.all(Report)
      json(allow_cors(conn), Poison.encode! %{reports: reports} )
    end

    def all_reports(conn, _params) do
      reports = Repo.all(Report)
      json(allow_cors(conn), Poison.encode! %{reports: reports} )
    end

  defp allow_cors(conn), do: put_resp_header(conn, "Access-Control-Allow-Origin", "*")
end
