class Ingredient < ActiveRecord::Base
  validates :query_id, :presence => true
  validates :result_id, :presence => true
  validates :ingredient, :presence => true, :uniqueness => {:scope => :result_id}

  belongs_to :query

end
