require 'open-uri'

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(:user_id => current_user.id)
  end

  def new
  end

  def show
  end

  def create
    @recipe = Recipe.new
    @recipe.user_id = current_user.id
    @recipe.dish = params[:dish]
    @recipe.save

    @component = Component.new
    @component.recipe_id = @recipe.id
    @component.ingredient = params[:component]
    @component.save

    redirect_to("/recipes")
  end

end
