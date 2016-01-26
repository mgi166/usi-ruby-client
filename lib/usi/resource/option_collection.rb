require 'forwardable'

module USI::Resource
  class OptionCollection
    extend Forwardable

    def self.create(args)
      option = Option.create(args)
      new(option)
    end

    def initialize(option)
      @options = {}
      add(option)
    end

    attr_reader :options
    def_delegators :@options, :[], :[]=, :keys, :values, :each

    def update(args)
      option = Option.create(args)
      add(option)
      self
    end

    def add(option)
      options[option.name] = option
    end
  end
end
