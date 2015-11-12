class BlogController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    # @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
    @links = @blog.links
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end

  def blog_params
    params.require(:blog).permit(:title,:body,:links)
  end

end
