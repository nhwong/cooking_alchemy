class Query < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :query, :presence => true

  belongs_to :user
  has_many :ingredients

end
