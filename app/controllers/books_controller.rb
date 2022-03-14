class BooksController < ApplicationController
	before_action :current_book, only: [:show, :edit, :update, :destroy]
    respond_to :json
  def index
  	@books = Book.all
  	render json: @books
  end

  def show
  end

  def new
  	@book  = Book.new
  end
  def create
  	@book = Book.create(book_params)
  	render json: @book
  	# redirect_to book_path(@book)
  end

  def edit
  end
  def update
  	@book.update(book_params)
  	render json: @book
  	# redirect_to book_path(@book)
  end
  def destroy
  	@book.destroy
  	render json: @book
  	# redirect_to books_path
  end
  private
  def book_params
  	params.require(:book).permit(:title, :isbn, :description, :author_id)
  end	
  def current_book
  	@book = Book.find(params[:id])
  end
end
