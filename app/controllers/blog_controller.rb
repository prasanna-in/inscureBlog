class BlogController < ApplicationController
  def index
    @blogs = Blog.all
  end
  def new

  end
  def show
    @blog = Blog.find(params[:id])
    @links = @blog.links.split(":")
  end
end
