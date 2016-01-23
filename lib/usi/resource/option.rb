module USI::Resource
  class Option
    def create(args)
      commands = parse(args)
      new(commands)
    end

    def self.parse(args)
      args.split(" ").each_slice(2).to_a.reject { |x| x.size != 2 }
    end

    def initialize(commands)
      @var = []

      assign_attributes(commands)
    end

    attr_accessor :name, :type, :default, :min, :max, :var

    def default=(value)
      # NOTE: USI protocol specification, `type` attributes always exists.
      # http://www.geocities.jp/shogidokoro/usi.html
      case type
      when "check"
        case value
        when "true"
          @default = true
        when "false"
          @default = false
        else
          # TODO: This value is invalid according to USI protocol specification
          @default = value
        end
      when "spin"
        @default = value.to_i
      else
        @default = value
      end
    end

    def var=(value)
      @var << value
    end

    def max=(value)
      @max = value.to_i
    end

    def min=(value)
      @min = value.to_i
    end

    private

    def assign_attributes(attributes)
      attributes.each do |sub_command, value|
        send("#{sub_command}=", value)
      end
    end
  end
end
