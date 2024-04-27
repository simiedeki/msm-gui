class ActorsController < ApplicationController
  def create
    # params hash looks like this:
    # {"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director_id"=>"6"}

    a = Actor.new
    a.name = params.fetch("the_name")
    a.dob = params.fetch("the_dob")
    a.bio = params.fetch("the_bio")
    a.image = params.fetch("the_image")
  

    a.save

    redirect_to("/actors")

    # Retrieve the user's inputs from params
    # Create a record in the movie table
    # Populate each column with the user input
    # Save

    # Redirect the user back to the /movies URL
  end

  def delete
    the_id = params.fetch("path_id")
    actor = Actor.find_by({ :id => the_id })
  
    actor.destroy
  
    redirect_to("/actors")
  end
  def update
    actor = Actor.find(params[:path_id])
    redirect_to("/actors/")
  
  end
  
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
