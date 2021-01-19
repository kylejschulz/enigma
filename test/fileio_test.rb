require_relative 'test_helper'

class FileIOTest < Minitest::Test
  def setup
    read = './little_brother.txt'
    write = './encrypted.txt'
    @filio = FileIO.new(read, write)
  end

  def test_it_exists
    assert_instance_of FileIO, @fileio
  end

  def test_it_has_attributes
    assert_equal './little_brother.txt', @fileio.read
    assert_equal './encrypted.txt', @fileio.write
  end
  
  def test_it_can_have_different_attributes
  end
end
