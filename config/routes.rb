Rails.application.routes.draw do
  devise_for :users

  root "queries#home"

  get "/results", :controller => "queries", :action => "results"
  get "/summary/:id", :controller => "queries", :action => "summary"
  get "/queries", :controller => "queries", :action => "queries_index"
  get "/queries/:query_id", :controller => "queries", :action => "query_results"
  get "/queries/delete/:query_id", :controller => "queries", :action => "delete_query"

  get "/recipes", :controller => "recipes", :action => "index"
  get "/recipes/new", :controller => "recipes", :action => "new"
  get "/recipes/:id", :controller => "recipes", :action => "show"
  get "/recipes/:id/edit", :controller => "recipes", :action => "edit"
  post "/create_recipe", :controller => "recipes", :action => "create"

end
