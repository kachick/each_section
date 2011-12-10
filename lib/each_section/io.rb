# Copyright (C) 2010  Kenichi Kamiya

require 'strscan'
require_relative 'core'

module EachSection
  module IOExtension
    def each_section(separator=$/, &block)
      case separator
      when Regexp
        if block_given?        
          scanner = StringScanner.new ''
          
          while buffer = read(MIN_BUFFER_SIZE)
            scanner = StringScanner.new(scanner.rest + buffer)
            while section = scanner.scan_until(separator)
              block.call section
            end
          end
          
          block.call scanner.rest unless scanner.eos?
  
          self
        else
          return to_enum :each_section, separator
        end
      else
        each_line separator, &block
      end
    end
    
    alias_method :sections, :each_section
  end
end