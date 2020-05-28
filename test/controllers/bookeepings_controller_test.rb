require 'test_helper'

class BookeepingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bookeepings_index_url
    assert_response :success
  end

end
