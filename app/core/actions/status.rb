module Actions
  class Status
    def initialize(type, error = nil)
      @type = type
      @error = error
    end

    def success
      yield if @type == :success
    end

    def error
      yield(@error) if @type == :error
    end
  end
end
