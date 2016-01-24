module USI::Resource
  class Checkmate
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
  end
end
