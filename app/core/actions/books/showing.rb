module Actions
  module Books
    class Showing
      def initialize(id)
        @id = id
      end

      def call
        yield(Book.find(@id))
      end
    end
  end
end
