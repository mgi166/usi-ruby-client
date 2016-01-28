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

    def position(moves, sfen: nil)
      position = sfen ? "sfen #{sfen}" : "startops"
      command("position #{position} moves #{moves.join(' ')}")
    end

    def go_ponder
      command("go ponder")
    end

    def go_infinite
      command("go infinite")
    end

    def go_mate(time)
      limit = time ? time : "infinite"
      command("go mate #{limit}")
    end

    def go(btime: nil, wtime: nil, byoyomi: nil)
      cmd = "go"
      cmd += " btime #{btime}" if btime
      cmd += " wtime #{wtime}" if wtime
      cmd += " byoyomi #{byoyomi}" if byoyomi
      command(cmd)
    end

    private

    def command(command)
      engine.command(command)
    end

    def valid_game_result?(result)
      %w(win lose draw).include?(result)
    end
  end
end
