class PostsController < ApplicationController
  def index
    @posts = Post.all

    @posts = @posts.search_post(params[:search_content]) if params[:search_content].present?

  end
end
