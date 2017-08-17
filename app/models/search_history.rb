class SearchHistory < ApplicationRecord

  before_save :update_total
  validates_presence_of :keyword
  validates_uniqueness_of :keyword
  
  VALID_SORT_ORDERS = ['created_at desc', 'create_date asc', 'keyword desc', 'keyword asc', 'total desc', 'total asc']
                        
  def self.top_10_game_searches
    self.order('total desc').first(10)
  end
  
  def self.create_or_update_total(keyword)
    search_history = SearchHistory.where("keyword" => keyword).first
    if search_history.blank?
      search_history = self.create(keyword: keyword,
                                   total: 0)
    else
      search_history.save
    end
    search_history
  end

  def self.sort_by(order)
    if VALID_SORT_ORDERS.include?(order)
      self.order(order)
    else
      self
    end
    
  end
  
  private

  def update_total
    if self.total.blank?
      self.total = 1
    else
      self.total = self.total + 1
    end
  end
end
