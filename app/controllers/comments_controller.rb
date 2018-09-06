class CommentsController < ApplicationController

  def new
    @post = Post.find(params['post_id'].to_i)
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private
    def comment_params
      user_id = params[:comment][:user_id].to_i
      params.require(:comment).permit(:comment, :user_id)
      new_params = {:comment => params[:comment][:comment], :user_id => user_id}
    end
  end
