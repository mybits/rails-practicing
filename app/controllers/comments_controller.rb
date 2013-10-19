class CommentsController < ApplicationController
	before_filter :authenticate_user!
	expose(:post)
	expose(:comments) { post.comments }
	expose(:comment)  

	def index
	end

	def new
	end

	
	def create
		comment = post.comments.build(params[:comment])
		comment.user = current_user
		comment.save
		redirect_to post_path(post)
	end
end
