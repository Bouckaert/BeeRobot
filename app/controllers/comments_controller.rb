class CommentsController < ApplicationController
  respond_to :js


	def create
	    @user = User.find(params[:user_id])
	    @comment = @user.comments.create(params[:comment].permit(:commenter, :body))

	 respond_to do |format|
	    if @comment.save
	      format.js
	    else
		respond_with @comment.errors, :status => :unprocessable_entity
	    end
	 end

	end

	def destroy
	    @user = User.find(params[:user_id])
	    @comment = @user.comments.find(params[:id])
	    
		respond_to do |format|
		if @comment.destroy
		format.js
		else
		respond_with @comment.errors, :status => :unprocessable_entity
	    	end

		end
	end

end
