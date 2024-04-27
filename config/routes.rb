Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/insert_actor", { :controller => "actors", :action => "create" })
  post("/insert_director", { :controller => "directors", :action => "create" })
  
  post("/insert_movie_record", { :controller => "movies", :action => "create" })
  
  get("/delete_movie/:path_id", { :controller => "movies", :action => "delete" })
  
  get("/delete_actor/:path_id", { :controller => "actors", :action => "delete" })
 

  get("/delete_director/:path_id", { :controller => "directors", :action => "delete" }) 
  post '/update_director/:path_id', to: 'directors#update'
  post '/update_actor/:path_id', to: 'actors#update'
  post '/update_movie/:path_id', to: 'movies#update'
    
end
