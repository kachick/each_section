# Copyright (C) 2010  Kenichi Kamiya

require 'strscan'

module EachSection
  VERSION = '0.0.1'.freeze
  Version = VERSION

  MIN_BUFFER_SIZE = 4096

  module StringExtension
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
          return to_enum :each_section, separator
        end
      else
        each_line separator, &block
      end
    end
  end

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
  end
end

class String
  include EachSection::StringExtension
end

class IO
  include EachSection::IOExtension
end

ARGF.extend EachSection::IOExtension

if defined? StringIO
  class StringIO
    include EachSection::IOExtension
  end
end