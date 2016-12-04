require 'open-uri'

class QueriesController < ApplicationController
  def home
  end

  def results
    @query = Query.new
    @query.user_id = current_user.id
    @query.query = params[:query]

    query_save_status = @query.save

    if query_save_status != true
      redirect_to("/", :notice => "Unsuccessful query")
    end

    food_2_fork_search_url = "http://food2fork.com/api/search?key=9d4bb2fbc1fb896ab72ed80caa894eb2&q="
    full_url = food_2_fork_search_url + params[:query]
    food_2_fork_hash = JSON.parse(open(full_url).read)

    @max_recipe_index = [food_2_fork_hash["recipes"].length, 2].min - 1
    @ingredient_lists = Array.new
    for i in 0..@max_recipe_index
      rId = food_2_fork_hash["recipes"][i]["recipe_id"]
      food_2_fork_recipe_url = "http://food2fork.com/api/get?key=9d4bb2fbc1fb896ab72ed80caa894eb2&rId=" + rId.to_s
      @ingredient_lists << JSON.parse(open(food_2_fork_recipe_url).read)["recipe"]["ingredients"]

      @ingredient_lists[i].each do |recipe_ingredient|
        ingredient = Ingredient.new
        ingredient.query_id = @query.id
        ingredient.result_id = i
        ingredient.ingredient = recipe_ingredient
        ingredient.save
      end
    end

  end

  def summary
    @query_id = params[:id]
  end

end
