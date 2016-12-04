require 'open-uri'

class QueriesController < ApplicationController
  def home
  end

  def results
    @dish = Dish.where(:dish => params[:query])
    @query = Query.new

    if @dish.count == 0
      @dish = Dish.new
      @dish.dish = params[:query]
      dish_save_status = @dish.save
      if dish_save_status != true
        redirect_to("/", :notice => "Unsuccessful query")
      end

      @query.dish_id = @dish.id
      query_save_status = @query.save
      if query_save_status != true
        redirect_to("/", :notice => "Unsuccessful query")
      end
    end

    food_2_fork_search_url = "http://food2fork.com/api/search?key=9d4bb2fbc1fb896ab72ed80caa894eb2&q="
    full_url = food_2_fork_search_url + params[:query]
    food_2_fork_hash = JSON.parse(open(full_url).read)
    @result_hash = food_2_fork_hash
    max_recipes = [@result_hash["recipes"].length, 2].min - 1

    @ingredient_lists = Array.new
    for i in 0..max_recipes
      @ingredient_lists << get_recipes(@result_hash, i)["recipe"]["ingredients"]
    end

  end

  def summary
  end

  def get_recipes(hash, i)
    rId = hash["recipes"][i]["recipe_id"]
    food_2_fork_recipe_url = "http://food2fork.com/api/get?key=9d4bb2fbc1fb896ab72ed80caa894eb2&rId=" + rId.to_s
    return JSON.parse(open(food_2_fork_recipe_url).read)
  end

end
