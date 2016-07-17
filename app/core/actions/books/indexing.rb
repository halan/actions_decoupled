module Actions
  module Books
    class Indexing
      def call
        yield(Book.all)
      end
    end
  end
end
