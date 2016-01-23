module USI::Resource
  class Bestmove
    def self.parse(args)
      ponder = nil
      bestmove, ponders = args.split(" ", 2)

      if ponders
        command, move = ponders.split(" ", 2)
        if command == "ponder"
          ponder = { "ponder" => move }
        else
          # TODO: raise or log
        end
      end

      [bestmove, ponder]
    end
  end
end
