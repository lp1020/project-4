class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
    @category = Category.all
  end
  def show
    @category = Category.find(@post.category_id)
  end
  def new
    @post = Post.new
  end
  def all
    @posts = Post.all
    @category = Category.all
  end
  def create
    post = Post.new(post_params)
    post.user = current_user
    post.save!
    redirect_to posts_url
  end
def edit

end
def update
  respond_to do |format|
    if @post.update(post_params)
      format.html { redirect_to post_url, notice: "Post was successfully updated."}
    else
      format.html { render :edit }
    end
  end
end
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destoryed."}
      format.json { head :no_content }
  end
end
  private
   def set_post
    @post = Post.find(params[:id])
 end
  def post_params
    params.require(:post).permit(:name, :category_id, :is_cruelty_free, :link)
  end
end

