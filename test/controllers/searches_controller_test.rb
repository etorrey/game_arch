require 'test_helper'

class SearchesControllerTest < ActionDispatch::IntegrationTest

  test "should render the index page on GET to index" do
    get root_url

    assert_response :success
  end
  
end
