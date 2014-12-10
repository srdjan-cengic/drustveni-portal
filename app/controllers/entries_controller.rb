class EntriesController < ApplicationController
  def new
  	@entry = Entry.new(user_id: current_user.id) #user_id kao atribut(kolona) entry-a
  	@entry.build_storage

    respond_to do |format|
      format.html { render partial: 'form' }
      format.js { 
        @id = params[:entry][:category_id]
      }
    end
  	#irb(main):003:0> entry = Entry.new(id: 10)
    #<Entry id: 10, status: "P", user_id: nil, category_id: nil, created_at: nil, updated_at: nil>
    #irb(main):004:0> entry.build_storage
    #<Storage id: nil, title: nil, content: nil, entry_id: 10, created_at: nil, updated_at: nil>
  end

  def create
  	# render text: @entry.inspect nil, naravno, kakvo crno prosljeđivanje sa view-a u kontroler
  	# params[:entry] <=> {"category_id"=>"1", 
  	#                     "storage_attributes"=>{"title"=>"title-juhu", "content"=>"content-juhu"}, 
  	#                     "user_id"=>"3"}
  	permitted = params[:entry].permit(:category_id, :user_id, storage_attributes: [:title, :content])

  	entry = Entry.new(permitted) # U ovom momentu postoji i entry.storage
  	entry.storage.build_vote

  	if entry.save
  		redirect_to root_path, notice: "Successfuly created new post"
  	else
  		render 'new'
  	end
  end
  #def content
    #@id = params[:id]

    #respond_to do |format|
      #format.js
    #end

  #end
end
