class CommentsController < ApplicationController

  def new
    @post = Post.find(params['format'].to_i)
    @comment = Comment.new
  end

  def create
    @post = Post.find(params['post_id'])
    if @post.comments.create(post_params)

      redirect_to "/posts/#{@post.id}"
    else
      render :new
    end
  end

  private
    def post_params
      params.require(:comment).permit(:comment)
    end
  end
