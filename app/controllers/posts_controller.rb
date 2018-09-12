class PostsController < ApplicationController
  before_action :find_post, only: :show
  def index
    @posts = Post.all
    @posts = @posts.search_post(params[:search_content]) if params[:search_content].present?
  end

  def new
  end

  def create
  end

  def show
    
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def find_post
    @post = Post.friendly.find_by id: params[:id]
  end
end
