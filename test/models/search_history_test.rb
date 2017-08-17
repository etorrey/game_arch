require 'test_helper'

class SearchHistoryTest < ActiveSupport::TestCase

  test "keyword should be unique" do
    search = SearchHistory.new(:keyword => 'keyword')
    assert search.save

    search = SearchHistory.new(:keyword => 'keyword')
    assert !search.save
  end

  test "should create_or_update_total for a new search history and then update its total" do
    search = SearchHistory.create_or_update_total('keyword')
    assert_equal 1, search.total 

    search = SearchHistory.create_or_update_total('keyword')
    assert_equal 2, search.total
  end
end
