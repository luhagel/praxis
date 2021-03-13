defmodule PraxisWeb.PageLiveTest do
  use PraxisWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Patient Management System Prototype"
    assert render(page_live) =~ "Patient Management System Prototype"
  end
end
