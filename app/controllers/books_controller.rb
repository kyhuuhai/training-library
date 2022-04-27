class BooksController < ApplicationController
  before_action :logged_in_user

  def index
    @books = Book.includes(:author, :rates).search(params)
      .paginate(page: params[:page], per_page: 12)
  end

  def show 
    @books = Book.includes(:author, :publisher).find(params[:id])
  end

end
