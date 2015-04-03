class CommentsController < ApplicationController
	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		if @comment.save
			flash[:notice] = "Comment successfully added!"
		else
			flash[:alert] = "Error ooops"
    end
		respond_to do |format|
	    format.html { redirect_to :back }
	    format.js
  	end
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to post_path(@post)
		else
			flash[:notice] = "Error OOps"
			render :edit
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@post = Post.find(params[:post_id])
		@comment.post_id = @post.id
		@comment.destroy
		flash[:notice] = "Comment successfully deleted."
		redirect_to post_path(@post)
	end


	private
  def comment_params
    params.require(:comment).permit(:content, :name)
  end
end