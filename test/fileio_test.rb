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

  def test_it_can_open_handle_and_returns_file_object
    assert_equal File, @fileio.open_handle.class
  end

  def test_it_can_read_handle
    expected = 'one morning i woke up'
    @fileio.open_handle

    assert_equal expected, @fileio.read_handle
  end

  def test_it_can_close_handle_and_it_returns_nil
    assert_nil @fileio.close_handle
  end

  def test_it_can_open_writer_file_and_returns_file_object
      assert_equal File, @fileio.open_writer.class
  end


end
