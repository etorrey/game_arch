class SearchHistory < ApplicationRecord

  before_save :update_total
  validates_uniqueness_of :keyword

  def self.create_or_update_total(keyword)
    search_history = SearchHistory.where("keyword" => keyword).first
    if search_history.blank?
      search_history = self.create("keyword" => keyword,
                  "total" => 0)
    else
      search_history.save
    end
    search_history
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
