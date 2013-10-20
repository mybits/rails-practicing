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
    comment.votes.create(:user_id => current_user.id, :value => params[:value1].to_i)
    val = params[:value1].to_i
    summary = comment.votes_value + val
   
    if summary <= -3 && comment.abusive == false
    	 comment.update_attribute :abusive, true    	 
    end

    comment.update_attribute :votes_value, summary
    redirect_to post_path(post),  :method => :post


  end

end
