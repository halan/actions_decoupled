class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit]

  # GET /books
  # GET /books.json
  def index
    Actions::Books::Indexing.new.() {|books| @books = books }
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    Actions::Books::Building.new.() {|book| @book = book }
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    Actions::Books::Saving.new(book_params).() do |book, having|
      @book = book

      respond_to do |format|
        having.success do
          format.html { redirect_to @book, notice: 'Book was successfully created.' }
          format.json { render :show, status: :created, location: @book }
        end

        having.error do |errors|
          format.html { render :new }
          format.json { render json: errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    Actions::Books::Updating.new(params[:id], book_params).() do |book, having|
      @book = book

      respond_to do |format|
        having.success do
          format.html { redirect_to @book, notice: 'Book was successfully updated.' }
          format.json { render :show, status: :ok, location: @book }
        end

        having.error do |errors|
          format.html { render :edit }
          format.json { render json: errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    Actions::Books::Destroying.new(params[:id]).() do |book|
      @book = book

      respond_to do |format|
        format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      Actions::Books::Showing.new(params[:id]).() do |book|
        @book = book
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author)
    end
end
