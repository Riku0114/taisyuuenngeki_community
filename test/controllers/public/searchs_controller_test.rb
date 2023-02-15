require "test_helper"

class Public::SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_searchs_index_url
    assert_response :success
  end
end
