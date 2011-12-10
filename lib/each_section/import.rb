# Copyright (C) 2010  Kenichi Kamiya

require_relative 'string'
require_relative 'io'

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