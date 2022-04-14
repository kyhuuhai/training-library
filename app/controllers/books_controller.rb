class BooksController < ApplicationController
  def index
    @books = Book.search(params)
  end
  def show
    @books = Book.find(params[:id])
  end
end
