class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :username, :presence => true, :uniqueness => true

   has_many :queries
   has_many :query_ingredients, :through => :queries, :source => :ingredients
   has_many :recipes
   has_many :recipe_components, :through => :recipes, :source => :components

end
