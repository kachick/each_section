# Copyright (C) 2011  Kenichi Kamiya

unless respond_to? :require_relative

  # @param [String] child
  # @return [Boolean]
  def require_relative(child)
    from = caller.first.slice(/(.*?):\d+/, 1)
    require "#{File.dirname from}/#{child}"
  end

end