module Actions
  module Books
    class Destroying
      def initialize(id)
        @id = id
      end

      def call
        Showing.new(@id).() {|book| @resource = book}
        @resource.destroy
        yield(@resource)
      end
    end
  end
end
