# Copyright (C) 2010  Kenichi Kamiya

require 'strscan'
require_relative 'core'

module EachSection


module StringExtension

  # @param [Regexp, String]
  # @return [self] - no block given
  # @yield [section]
  # @yieldparam [String] section
  def each_section(separator=$/, &block)
    case separator
    when Regexp
      if block_given?
        scanner = StringScanner.new self
        
        while section = scanner.scan_until(separator)
          block.call section
        end
        
        block.call scanner.rest unless scanner.eos?

        self
      else
        return to_enum __method__, separator
      end
    else
      each_line separator, &block
    end
  end
  
  alias_method :sections, :each_section

end


end