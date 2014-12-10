class HomeController < ApplicationController
  
  #Filters are methods that are run before, after or "around" a controller action.
  before_action :vote_logic, only: [:vote_up, :vote_down]

  def index
  	@posts = User.joins(:entries => [{:storage => :vote}, :category])
                 .where("entries.status = ?", "A")
                 .select("users.username AS username,
                         storages.id AS storage_id,
                         storages.title AS title, 
                         storages.content AS content, 
                         votes.count AS votes, 
                         categories.category_name AS category_name")
                 .order("entries.created_at DESC")
  end

  def vote_up
    if @vote_allowed
      @storage.vote.count += 1
      @storage.vote.save
    end
    # Odgovori u svakom slucaju, tj. bez obzira na vote_allowed
    respond_to do |format|
        format.js
    end
  end

  def vote_down
    if @vote_allowed
      @storage.vote.count -= 1
      @storage.vote.save
    end

    respond_to do |format|
        format.js
    end
  end

  # For controllers, you should mark the "helper" methods as protected, 
  # and only the actions themselves should be public. The framework will 
  # never route any incoming HTTP calls to actions/methods that are not public, 
  # so your helper methods should be protected in that way.
  private
  def vote_logic
    @content_holder = "likes_#{params[:storage_id]}"
    key = "has_voted_#{params[:storage_id]}".to_sym

    if !session[key] # TRUE if it is nil or false
      @vote_allowed = true
      @storage = Storage.find(params[:storage_id])

      session[key] = true
    else
      @vote_allowed = false
    end
  end
end
