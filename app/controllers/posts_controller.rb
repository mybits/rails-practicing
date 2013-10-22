class PostsController < ApplicationController
  before_filter :authenticate_user!
  expose(:user)
  expose_decorated(:posts)
  expose_decorated(:post)
  expose(:comments)
  expose(:tag_cloud) { [] }

  def index
  end

  def new
  end

  def edit
  end

  def update
    post.save     
    redirect_to post_path, notice: "Post has been updated."
  end

  def destroy
    post.destroy
    redirect_to posts_path, notice: "Post was deleted."    
  end

  def show
  end

  def mark_archived
    post.archive!
    render action: :index
  end

  def create
    post.user = current_user
    if post.save
      redirect_to action: :index
    else
      render :new
    end
  end

end
