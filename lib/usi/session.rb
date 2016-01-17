require "forwardable"
require "open3"

module USI
  class Session
    attr_reader :engine, :stdin, :stdout, :stderr, :wait_thr, :pid
    extend Forwardable

    def_delegators :@wait_thr, :pid

    def initialize(engine)
      @engine = engine
      @stdin, @stdout, @stderr, @wait_thr = *Open3.popen3(@engine.engine_path.to_s, chdir: @engine.engine_path.dirname)
    end

    def write(command)
      @stdin.puts command
      @stdin.close
    end

    def read
      Response.new(@stdout.read)
    end
  end
end
