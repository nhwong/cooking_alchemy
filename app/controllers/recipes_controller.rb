require 'open-uri'

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(:user_id => current_user.id)
  end

  def new
  end

  def show
    @recipe = Recipe.find(params[:id])
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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def delete
    @recipe = Recipe.find(params[:id])
    @components = @recipe.components
    @components.destroy_all
    @recipe.destroy
    redirect_to("/recipes", :notice => "Recipe deleted")
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.dish = params[:dish]
    recipe.save

    components = recipe.components
    components.destroy_all

    params.each do |key, value|
      next if !/\A\d+\z/.match(key)
      component = Component.new
      component.recipe_id = recipe.id
      component.ingredient = value
      component.save
    end

    redirect_to("/recipes", :notice => "Recipe deleted")
  end

end
