module USI::Resource
  class Score
    def initialize(args)
      assign_attributes(args)
    end

    attr_accessor :cp, :mate, :state

    def cp=(value)
      @cp = value.to_f
    end

    private

    def assign_attributes(args)
      case args.size
      when 2
        send("#{args[0]}=", args[1])
      when 3
        send("#{args[0]}=", args[1])
        @state = args[2]
      else
        # log and raise
      end
    end
  end
end
