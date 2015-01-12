class CommentsController < ApplicationController
	def index
		@posts = User.joins(:entries => [{:storage => :vote}, :category])
                 .where("entries.status = ?", "A")
                 .where("entries.id =?",params[:entry_id])
                 .select("users.username AS username,
                         storages.id AS storage_id,
                         storages.title AS title, 
                         storages.content AS content, 
                         votes.count AS votes, 
                         entries.id AS entries_id,
                         categories.category_name AS category_name")

		@comments = Comment.joins(:entry,:user)
							.where("entry_id =?",params[:entry_id]);

		@entry_id = params[:entry_id];
	end

	def create
		if params[:comment_text] 
			comment = Comment.new({:comment_text => params[:comment_text], :entry_id => params[:entry_id],:user_id=> params[:user_id]})
		end

	if comment.save
  		redirect_to comments_path(entry_id: params[:entry_id] ), notice: "Successfuly added comment"
  	else
  		redirect_to root_path, notice: "Unsuccessfull"
  	end
	end

	def new
  		@comment = Comment.new
 	end

end
