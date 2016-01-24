module USI::Resource
  class Checkmate
    def self.create(args)
      moves, state = parse(args)
      new(moves, state)
    end

    def self.parse(args)
      state = nil
      moves = args.split(" ")

      if checkmate_puzzle?(moves.first)
        state = moves.shift
      end

      [moves, state]
    end

    def self.checkmate_puzzle?(value)
      %w(notimplemented timeout nomate).include?(value)
    end

    def initialize(move, state)
      @move, @state = move, state
    end

    attr_accessor :move, :state
  end
end
