require_relative 'test_helper'

class FileIOTest < Minitest::Test
  def setup
    read = './little_brother'
    write = './encrypted.txt'
    @filio = FileIO.new()
  end
  def test_it_exists
  assert_instance_of
  end
  def test_it_has_attributes
  end
  def test_it_can_have_different_attributes
  end
end
