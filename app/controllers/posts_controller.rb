class PostsController < ApplicationController
	def index
		@posts = Post.all
		@user = current_user
	end

	def new
		@post = Post.new
		@user = User.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "Post successfully added!"
			redirect_to posts_path(@post)
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice] = "Post successfully updated."
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def show
		@post = Post.find(params[:id])
		@comments = Comment.all
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:notice] = "Post successfully deleted."
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :date, :content)
		end
end