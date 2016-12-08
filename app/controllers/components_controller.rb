require 'open-uri'

class ComponentsController < ApplicationController
  def delete
    component = Component.find(params[:id])
    recipe = component.recipe
    component.destroy
    redirect_to("/recipes/#{recipe.id}/edit")
  end

end
