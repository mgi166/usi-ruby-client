module USI::Resource
  class Checkmate
    def self.create(args)
      moves, state = parse(args)
      new(moves, state)
    end

    def self.parse(args)
      state = nil
      moves = args.split(" ")

      unless solved?(moves.first)
        state = moves.shift
      end

      [moves, state]
    end

    def self.solved?(value)
      ! %w(notimplemented timeout nomate).include?(value)
    end

    def initialize(move, state)
      @move, @state = move, state
    end

    attr_accessor :move, :state

    def solved?
      self.class.solved?(state)
    end
  end
end
