class CommentsController < ApplicationController
	before_filter :authenticate_user!
	expose(:post)
	expose(:comments) { post.comments }
	expose(:comment)  
	expose(:vote) 

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


	def vote_up
    comment.votes.create(:user_id => current_user.id, :value => params[:value1])
    redirect_to post_path(post),  :method => :post
  end

end
