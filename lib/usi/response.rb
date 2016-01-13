module USI
  class Response
    attr_reader :output, :name, :author, :option, :game_result, :best_move, :ponder

    def initialize(output)
      @output = output
      @option = {}
      parse
    end

    def parse
      output.split("\n").each do |line|
        case line
        when /^id name (.+)$/
          @name = $1
        when /^id author (.+)$/
          @author = $1
        when /^option name (.+?) type (.+?)( (.+))??$/
          @option[$1] = { type: $2, params: $4 } if $1
        when /^usiok$/
          @usiok = true
        when /^readyok$/
          @ready = true
        when /^bestmove (.+?)( ponder (.+?))??$/
          if %w(resign win).include?($1)
            @game_result = $1
          else
            @best_move = $1
            @ponder = $3
          end
        end
      end
    end

    def usiok?
      !! @usiok
    end

    def ready?
      !! @ready
    end
  end
end
