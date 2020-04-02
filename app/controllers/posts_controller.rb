class PostsController < ApplicationController
  def index
    @posts = Post.order('updated_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.persisted?
      redirect_to :posts
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
      redirect_to :posts
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :posts
  end
  
  def show
    # @post = Post.find(params[:id]), @post.comments
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :updated_at)
    end
  
end
