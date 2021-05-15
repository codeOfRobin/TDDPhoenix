defmodule ChatterWeb.UserVisitsHomepageTest do
  use ChatterWeb.FeatureCase, async: false

  test "user can visit homepage", %{session: session} do
    user = build(:user) |> insert()

    session
    |> visit("/")
    |> sign_in(as: user)
    |> assert_has(Query.css(".title", text: "Welcome to Chatter!"))
  end
end
