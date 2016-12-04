class Component < ActiveRecord::Base
  validates :recipe_id, :presence => true
  validates :ingredient, :presence => true

  belongs_to :recipe
  
end
