class HomeController < ApplicationController

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
  
end