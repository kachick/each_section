# Copyright (C) 2011  Kenichi Kamiya

unless respond_to? :require_relative
  module RubyCompatibility192Object
    def require_relative(child)
      from = caller.first.slice(/(.*?):\d+/, 1)
      require "#{File.dirname from}/#{child}"
    end
  end

  class Object
    include RubyCompatibility192Object
  end
end
