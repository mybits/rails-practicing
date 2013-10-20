class CommentsController < ApplicationController
	before_filter :authenticate_user!
	expose(:post)
	# expose(:comments) { post.comments }
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

    if already_voted
      flash[:notice] = "You can't vote twice."
      redirect_to post_path(post)
      return
    end

	  comment.votes.create(:user_id => current_user.id, :value => params[:value1].to_i)
	  val = params[:value1].to_i
	  summary = comment.votes_value + val
	  abusive?
    comment.update_attribute :votes_value, summary
    redirect_to post_path(post)	   
  end


  def abusive?
  	val = params[:value1].to_i
    summary = comment.votes_value + val
  	if summary <= -3 && comment.abusive == false
    	 comment.update_attribute :abusive, true    	 
    end
  end


  def already_voted    
    comment.votes.each do |vote|
    	if vote.user_id == current_user.id    		
    		return true
    	end    	
    end
    return false
  end	


  def mark_as_not_abusive
  	flash[:notice] = "Post: #{post.id} You: #{current_user.id} - author: #{post.user}."
  	if comment.abusive && (current_user.owner? post)
  		comment.update_attribute :abusive, false
  		comment.update_attribute :votes_value, 0
  		flash[:notice] = "Comment marked as not abusive"
  	end
  	redirect_to post_path(post)
  end
 
end