require 'test_helper'

class SearchesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @fake_result = mocha()
    @fake_result.stubs(alternative_names: [{'name' => 'name'}], summary: 'summary', rating_count: 11, rating: 11)
  end
  
  test "should render the index page on GET to index" do
    get root_url

    assert_response :success
  end

  test "should create_or_update_total for a keyword search on POST to create" do
    IGDB_CONNECTION::Game.expects(:search).returns([@fake_result])
    SearchHistory.expects(:create_or_update_total)
    post searches_path(query: 'query')
    
    assert_response :success
  end
  
  test "sidebar should render the same contents as the create but not call create_or_update on search history" do
    IGDB_CONNECTION::Game.expects(:search).returns([@fake_result])
    SearchHistory.expects(:create_or_update_total).never
    get sidebar_search_path('query')
    
    assert_response :success
  end

end
