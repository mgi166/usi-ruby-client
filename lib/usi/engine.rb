module USI
  class Engine
    attr_reader :engine_path

    def initialize(engine_path)
      @engine_path = Pathname.new(engine_path)
    end
  end
end
