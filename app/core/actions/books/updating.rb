module Actions
  module Books
    class Updating
      def initialize(id, book_params)
        @id = id
        @book_params = book_params
      end

      def call(&block)
        Showing.new(@id).() {|book| @resource = book}
        Saving.new(@book_params, @resource).(&block) 
      end
    end
  end
end
