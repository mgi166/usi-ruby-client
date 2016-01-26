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

    def update(args)
      option = Option.create(args)
      add(option)
      self
    end

    def add(option)
      options[option.name] = option
    end

    def [](option_name)
      options[option_name]
    end
  end
end
