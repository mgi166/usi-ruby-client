require "open3"

module USI
  class Session
    attr_reader :engine, :stdin, :stdout, :stderr, :wait_thr

    def initialize(engine)
      @engine = engine
      @stdin, @stdout, @stderr, @wait_thr = *Open3.popen3(@engine.engine_path.to_s, chdir: @engine.engine_path.dirname)
    end
  end
end
