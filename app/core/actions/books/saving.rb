module Actions
  module Books
    class Saving
      def initialize(book_params, resource = nil)
        @book_params = book_params
        @resource = resource
      end

      def call
        if resource.update_attributes(@book_params)
          yield(@resource, Status.new(:success))
        else
          yield(@resource, Status.new(:error, @resource.errors))
        end
      end

      private

      def resource
        @resource ||
          Building.new.() {|book| @resource = book}
      end
    end
  end
end
