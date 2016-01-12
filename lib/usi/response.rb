module USI
  class Response
    attr_reader :output

    def initialize(output)
      @output = output
      parse
    end

    def parse
      output.split("\n").each do |line|
        case line
        when /^usiok$/
          @usiok = true
        end
      end
    end

    def usiok?
      !! @usiok
    end
  end
end
