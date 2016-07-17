module Actions
  module Books
    class Building
     def call
        yield(Book.new)
      end
    end
  end
end
