defmodule Web.Router do
  use Web.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Web do
    pipe_through :api # Use the default browser stack

    get "/", PageController, :index

    get "/dealers",     UserController, :all_dealer
    get "/dealer/:id", UserController, :dealer

    get "/types",   UserController, :field_type
    get "/groups",  UserController, :field_group

    get "/fields",   UserController, :fields

    get "/reports",     UserController, :all_reports
    get "/reports/:id", UserController, :reports

    resources "/users", UserController
  end



  # Other scopes may use custom stacks.
  # scope "/api", Web do
  #   pipe_through :api
  # end
end
