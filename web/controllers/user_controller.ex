defmodule Rumbl.UserController do
  use Rumbl.Web, :controller

  def index(conn, _params) do
    users = Repo.all(Rubml.User)
    #users =
    #[
      #%Rumbl.User{id: "1", name: "George", username: "yan", password: "elixir"},
      #%Rumbl.User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
      #%Rumbl.User{id: "3", name: "Dave", username: "Tomas", password: "123456"},
    #]
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id }) do
    user = Repo.get(Rumbl.User, id)
    render conn, "show.html", user: user
  end
end
