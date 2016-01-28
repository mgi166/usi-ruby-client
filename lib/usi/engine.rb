module USI
  class Engine
    class NoSuchEngineError < ::LoadError; end

    attr_reader :engine_path

    def initialize(engine_path)
      @engine_path = Pathname.new(engine_path).expand_path
    end

    def init_session
      Session.new(self)
    end

    def command(command)
      Request.new(self).perform(command)
    end

    def validate!
      unless @engine_path.exist?
        raise NoSuchEngineError, "No such USI engine -- #{@engine_path}"
      end
    end
  end
end
