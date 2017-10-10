class PostsController < ApplicationController
  def index
    @posts = Post.all
    @category = Category.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    post.save!
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:name, :category_id, :is_cruelty_free, :link)
  end
end
