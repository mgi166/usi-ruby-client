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

    def initialize(commands)
      assign_attributes(commands)
    end

    attr_accessor *SUBCOMMANDS

    def depth=(value)
      @depth = value.to_i
    end

    def seldepth=(value)
      @seldepth = value.to_i
    end

    def time=(value)
      @time = value.to_i
    end

    def nodes=(value)
      @nodes = value.to_i
    end

    def hashfull=(value)
      @hashfull = value.to_i
    end

    def nps=(value)
      @nps = value.to_i
    end

    def string=(value)
      @string = value.join(" ")
    end

    def score=(value)
      if @score
        @score.update(value)
      else
        @score = Score.new(value)
      end
    end

    def update(args)
      commands = self.class.parse(args)
      assign_attributes(commands)
      self
    end

    private

    def assign_attributes(attributes)
      attributes.each do |attribute|
        attr = attribute.dup
        name = attr.shift

        case name
        when "pv", "string", "score"
          send("#{name}=", attr)
        else
          send("#{name}=", attr.first)
        end
      end
    end
  end
end
