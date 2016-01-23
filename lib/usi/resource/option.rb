module USI::Resource
  class Option
    def self.parse(args)
      args.split(" ").each_slice(2).to_a.reject { |x| x.size != 2 }
    end
  end
end
