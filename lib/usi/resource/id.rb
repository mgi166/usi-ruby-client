module USI::Resource
  class Id
    def self.parse(args)
      command, arg = args.split(" ", 2)

      if command != "name" || command != "author"
        # TODO: log or raise
      end

      # NOTE: `command` is `name` or `author`.
      { command => arg }
    end

    def self.create(args)
      attr = parse(args)
      new(attr)
    end

    def initialize(attributes)
      assign_attributes(attributes)
    end

    attr_accessor :name, :author

    def update(args)
      attr = self.class.parse(args)
      assign_attributes(attr)
    end

    private

    def assign_attributes(attributes)
      attributes.each do |attr_name, value|
        self.send("#{attr_name}=", value)
      end
    end
  end
end
