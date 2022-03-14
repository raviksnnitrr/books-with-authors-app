class AuthorsController < ApplicationController
  before_action :current_author, only: [:show, :edit, :update, :destroy]		
  respond_to :json

  def index
  	@authors = Author.all
  	render json: @authors
  end

  def show
  	render json: {author: @author, books: @author.books}
  end
  def new
  	@author = Author.new
  end
  def create
  	@author = Author.create(author_params)

  	render json: @author
  	# redirect_to author_path(@author)
  end

  def edit
  end

  def update
  	@author.update(author_params)
  	render json: @author
  	# redirect_to author_path(@author)
  end
  def destroy
  	@author.books.each do |book|
  		book.destroy
  	end
  	@author.destroy
  	# redirect_to authors_path
  end

  private
  def author_params
  	params.require(:author).permit(:first_name, :last_name)

  end
  def current_author
  	@author = Author.find(params[:id])
  end	
end
