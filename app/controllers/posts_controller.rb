class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
    render json: @posts, status: 200
  end

  def show
    @post = Post.find(params[:id])
    # AFTER USING OUR SERIALIZER
    respond_to do |format|
      format.html{render :show}
      format.json{render json: @post, status: 200}
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html{render :edit}
    end
  end

  def create
    @post = Post.create(post_params)
    @post.save
    render json: @post, status: 201
  end

  def edit
    respond_to do |format|
      format.html{render :edit}
    end
  end

  def update
    @post.update(post_params)
    render json: @post, status: 202
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
