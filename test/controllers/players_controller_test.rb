require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/players.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Player.count, data.length
  end

  test "show" do
    get "/players/#{Player.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "team", "position"], data.keys
  end

  test "create" do
    assert_difference "Player.count", 1 do
      post "/players.json", params: {name: "Jalen", team: "eagles", position: "QB"}
      assert_response 200
    end
  end
end
