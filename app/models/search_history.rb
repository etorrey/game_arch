class SearchHistory < ApplicationRecord

  before_save :update_total
  validates_uniqueness_of :keyword

  private

  def update_total
    self.total = self.total + 1 # race condition
  end
end
