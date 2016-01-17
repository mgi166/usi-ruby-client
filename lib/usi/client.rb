module USI
  class Client
    attr_reader :engine

    def initialize(engine_path)
      @engine = Engine.new(engine_path)
    end

    def usi
      command("usi")
    end

    def isready
      command("isready")
    end

    def usinewgame
      command("usinewgame")
    end

    def stop
      command("stop")
    end

    def ponderhit
      command("ponderhit")
    end

    def quit
      command("quit")
    end

    # TODO: setoption, position, go, gameover

    private

    def command(command)
      engine.command(command)
    end
  end
end
