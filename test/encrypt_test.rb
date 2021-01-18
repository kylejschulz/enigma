require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'
class EncryptTest < Minitest::Test
  def setup

    args = {
            encryption: 'hello world',
            key: "02715",
            date: "040895"
            }
    @encrypt = Encrypt.new(args)
  end

  def test_it_exists
    assert_instance_of Encrypt, @encrypt
  end

  def test_it_has_attributes
    expected = ("a".."z").to_a << " "

    assert_equal 'hello world', @encrypt.string
    assert_equal '02715', @encrypt.key
    assert_equal '040895', @encrypt.date
    assert_equal expected, @encrypt.alphabet
  end

  def test_keys_array_converts_key_string_into_array
    assert_equal [2, 27, 71, 15], @encrypt.keys_array
  end

  def test_offsets_array_converts_date_string_into_array
    assert_equal [1, 0, 2, 5], @encrypt.offsets_array
  end

  def test_total_shift_sums_keys_and_offsets
    assert_equal [3, 27, 73, 20], @encrypt.total_shift

  end

  def test_rotate_can_shift_a_letter

    assert_equal 'k', @encrypt.rotate_letter('h', 3)
    assert_equal 'e', @encrypt.rotate_letter('e', 27)
    assert_equal 'd', @encrypt.rotate_letter('l', 73)
    assert_equal 'e', @encrypt.rotate_letter('l', 20)
    assert_equal 'r', @encrypt.rotate_letter('o', 3)
    assert_equal ' ', @encrypt.rotate_letter(' ', 27)
    assert_equal 'o', @encrypt.rotate_letter('w', 73)
    assert_equal 'h', @encrypt.rotate_letter('o', 20)
    assert_equal 'u', @encrypt.rotate_letter('r', 3)
    assert_equal 'l', @encrypt.rotate_letter('l', 27)
    assert_equal 'w', @encrypt.rotate_letter('d', 73)

  end

  def test_it_can_rotate_entire_string
    assert_equal "keder ohulw", @encrypt.rotate_string

  end
end
