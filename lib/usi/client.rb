module USI
  class Client
    class MissingCommandParameter < StandardError; end

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

    def setoption(name, value)
      if name.nil? || name.to_s.empty? || \
         value.nil? || value.to_s.empty?
        raise MissingCommandParameter
      end

      command("setoption name #{name} value #{value}")
    end

    def gameover(game_result)
      raise MissingCommandParameter unless valid_game_result?(game_result)
      command("gameover #{game_result}")
    end

    # TODO: setoption, position, go, gameover

    private

    def command(command)
      engine.command(command)
    end

    def valid_game_result?(result)
      %w(win lose draw).include?(result)
    end
  end
end
