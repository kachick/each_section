require_relative 'test_helper'

module Test_EachSection

TEXT =<<EOD
class MyClass
  class MyException < StandardError; end

  class << self
    def method
      :end
    end
  end

  attr_reader :end

  def method
    :end
  end
end
EOD

SECTIONS = [
'class MyClass
  class MyException < StandardError; end
',
'
  class << self
    def method
      :end
    end
',
'  end
',
'
  attr_reader :end

  def method
    :end
  end
',
'end
'
].freeze

  module TestableEachSection
    REGEXP_SEPARATER = /\send\n?/
    
    attr_reader :reciever
    
    def test_each_section_with_block
      sections = []

      reciever.each_section REGEXP_SEPARATER do |str|
        sections << str
      end
      
      assert_equal sections, SECTIONS
    end
    
    def test_each_section_to_enum
      enum = reciever.sections REGEXP_SEPARATER
      result = enum.with_index.map{|s, i|"#{s}#{i}"}.join
      expect = SECTIONS.each.with_index.map{|s, i|"#{s}#{i}"}.join
      
      assert_equal result, expect
    end
  end

  class TestStringEachSection < Test::Unit::TestCase
    include TestableEachSection
    
    def setup
      @reciever = TEXT
    end
  end

  class TestIOEachSection < Test::Unit::TestCase
    include TestableEachSection
    
    def setup
      @reciever = StringIO.new TEXT
    end
  end

end
