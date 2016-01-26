module USI::Resource
  class OptionCollection
    def self.create(args)
      option = Option.create(args)
      new(option)
    end

    def initialize(option)
      @options = {}
      add(option)
    end

    attr_reader :options

    def add(option)
      options[option.name] = option
    end
  end
end
