module USI
  class Client
    attr_reader :engine

    def initialize(engine_path)
      @engine = Engine.new(engine_path)
    end
  end
end
