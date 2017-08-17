require 'test_helper'

class SearchHistoriesControllerTest < ActionDispatch::IntegrationTest

  test "should render the index page on GET to index" do
    get search_histories_path

    assert_response :success
  end
  
end
