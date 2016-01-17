module USI
  class Client
    attr_reader :engine

    def initialize(engine_path)
      @engine = Engine.new(engine_path)
    end

    def command(command)
      engine.command(command)
    end
  end
end
