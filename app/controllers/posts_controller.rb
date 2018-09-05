class PostsController < ApplicationController
  def index
    @posts = Post.all

    @posts = @posts.search_post(params[:search_content]) if params[:search_content].present?

    respond_to do |format|  
      format.html
      format.json { render :json => @posts.to_json }
      end
  end
end
