require "test_helper"

class Public::RankingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_rankings_index_url
    assert_response :success
  end

  test "should get gekidann" do
    get public_rankings_gekidann_url
    assert_response :success
  end

  test "should get yakusya" do
    get public_rankings_yakusya_url
    assert_response :success
  end
end
