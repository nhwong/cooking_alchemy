class Recipe < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :dish, :presence => true

  belongs_to :user
  has_many :components

end
