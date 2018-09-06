class PostsController < ApplicationController
  def index
    sort_value = params[:sort]
    if sort_value == 'title'
      @posts = Post.sort_alpha
    elsif sort_value == 'date'
      @posts = Post.sort_date
    else
      @posts = Post.all
    end
    @highlighted_post = Post.all.sample(1).first()
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    if params['button'] != nil
      returned_ratings = @post.post_rating(params['button'])
      @post.update(ratings: returned_ratings[0], avg_rating: returned_ratings[1])
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :description, :user_id)
  end
end
