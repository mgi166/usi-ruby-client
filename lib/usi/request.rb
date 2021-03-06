require "forwardable"
require "open3"

module USI
  class Request
    attr_reader :engine, :stdin, :stdout, :stderr, :wait_thr, :pid
    extend Forwardable

    def_delegators :@wait_thr, :pid, :status, :alive?, :stop?, :kill

    def initialize(engine)
      @engine = engine
      @stdin, @stdout, @stderr, @wait_thr = *Open3.popen3(@engine.engine_path.to_s, chdir: @engine.engine_path.dirname)
    end

    def perform(command)
      @stdin.puts command
      @stdin.close
      Response.new(@stdout.read)
    end
  end
end
