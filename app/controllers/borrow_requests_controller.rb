class BorrowRequestsController < ApplicationController
  before_action :get_books, only: [:show]
  def show 
    @borrow_request = BorrowRequest.new
  end

  def create
    @borrow_request = BorrowRequest.new(borrow_request_params)
    if @borrow_request.save
      flash[:success] = "Borrow request successfully"
      redirect_to root_path
    else
      render :show
    end
  end

  private
    def borrow_request_params
      params.require(:borrow_request).permit(:user_id, :book_id, :borrow_date, :return_date)
    end

    def get_books
      @book = Book.find_by_id(params[:id])
    end
end
