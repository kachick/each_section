$VERBOSE = true
require File.dirname(__FILE__) + '/test_helper.rb'

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
]

REGEXP_SEPARATER = /\send\n?/

class TestStringEachSection < Test::Unit::TestCase
  def setup
    @string = TEXT
  end
  
  def test_each_section_with_block
    sections = []

    @string.each_section REGEXP_SEPARATER do |str|
      sections << str
    end
    
    assert_equal sections, SECTIONS
  end
  
  def test_each_section_to_enum
    enum = @string.each_section REGEXP_SEPARATER
    result = enum.with_index.map{|s, i|"#{s}#{i}"}.join
    expect = SECTIONS.each.with_index.map{|s, i|"#{s}#{i}"}.join
    
    assert_equal result, expect
  end
end

class TestIOEachSection < Test::Unit::TestCase
  def setup
    @io = StringIO.new TEXT
  end

  def test_each_section_with_block
    sections = []

    @io.each_section REGEXP_SEPARATER do |str|
      sections << str
    end
    
    assert_equal sections, SECTIONS
  end
  
  def test_each_section_to_enum
    enum = @io.each_section REGEXP_SEPARATER
    result = enum.with_index.map{|s, i|"#{s}#{i}"}.join
    expect = SECTIONS.each.with_index.map{|s, i|"#{s}#{i}"}.join
    
    assert_equal result, expect
  end
end

