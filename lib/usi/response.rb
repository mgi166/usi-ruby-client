module USI
  class Response
    attr_reader :output, :id, :option, :bestmove, :checkmate, :info

    def initialize(output)
      @output = output
      parse
    end

    # TODO: refactor #parse

    def parse
      output.split("\n").each do |line|
        case line
        when /^usiok$/
          @usiok = true
        when /^readyok$/
          @ready = true
        when /^id (.+)$/
          if @id
            @id.update($1)
          else
            @id = Resource::Id.create($1)
          end
        when /^option (.+)$/
          if @option
            @option.update($1)
          else
            @option = Resource::OptionCollection.create($1)
          end
        when /^bestmove (.+)$/
          @bestmove = Resource::Bestmove.create($1)
        when /^checkmate (.+?)$/
          @checkmate = Resource::Checkmate.create($1)
        when /^info (.+)$/
          if @info
            @info.update($1)
          else
            @info = Resource::Info.create($1)
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
