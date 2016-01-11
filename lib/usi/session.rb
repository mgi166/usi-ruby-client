module USI
  class Session
    attr_reader :engine

    def initialize(engine)
      @engine = engine
    end
  end
end
