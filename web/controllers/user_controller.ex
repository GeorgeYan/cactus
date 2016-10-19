defmodule Rumbl.UserController do
  use Rumbl.Web, :controller
  alias Rumbl.User

  def index(conn, _params) do
    users = Repo.all(Rumbl.User)
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

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} create!")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end
