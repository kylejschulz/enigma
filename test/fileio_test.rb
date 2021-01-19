require_relative 'test_helper'

class FileIOTest < Minitest::Test
  def setup
    @read = './little_brother.txt'
    @write = './encrypted.txt'
    @fileio = FileIO.new(@read, @write)
  end

  def test_it_exists
    assert_instance_of FileIO, @fileio
  end

  def test_it_has_attributes
    assert_equal './little_brother.txt', @fileio.read
    assert_equal './encrypted.txt', @fileio.write
    assert_equal '', @fileio.key
    assert_equal '', @fileio.date
    assert_instance_of Enigma, @fileio.enigma
  end

  def test_it_can_open_handle
    expected = 'One morning I woke up'
    assert_equal expected, @fileio.open_handle 
  end
end
