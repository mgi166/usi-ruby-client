module USI::Resource
  class Option
    class UnknownType < ::TypeError; end

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
      validate!
    end

    attr_accessor :name, :type, :default, :min, :max, :var

    def validate!
      raise UnknownType, "Unknown or empty type -- #{type}" unless valid_type?(type)
    end

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

    def valid_type?(type)
      %w(check spin combo button string filename).include?(type)
    end
  end
end
