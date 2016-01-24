module USI::Resource
  class Info
    SUBCOMMANDS = %w(depth seldepth time nodes currmove hashfull nps string pv score)

    def self.create(args)
      commands = parse(args)
      new(commands)
    end

    def self.parse(args)
      args.split(" ").slice_when do |before, after|
        case after
        when *SUBCOMMANDS
          true
        else
          false
        end
      end.to_a
    end
  end
end
