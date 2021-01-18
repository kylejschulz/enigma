require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
class DecryptTest < Minitest::Test
  def setup

    args = {
            decryption: "keder ohulw",
            key: "02715",
            date: "040895"
            }
    @decrypt = Decrypt.new(args)
  end

  def test_it_exists
    assert_instance_of Decrypt, @decrypt
  end

  def test_it_has_attributes
    expected = ("a".."z").to_a << " "

    assert_equal "keder ohulw", @decrypt.string
    assert_equal '02715', @decrypt.key
    assert_equal '040895', @decrypt.date
    assert_equal expected, @decrypt.alphabet
  end

  def test_keys_array_converts_key_string_into_array
    assert_equal [2, 27, 71, 15], @decrypt.keys_array
  end

  def test_offsets_array_converts_date_string_into_array
    assert_equal [1, 0, 2, 5], @decrypt.offsets_array
  end

  def test_total_shift_sums_keys_and_offsets
    assert_equal [3, 27, 73, 20], @decrypt.total_shift

  end

  def test_decrypt_letter_can_decrypt_a_letter
    assert_equal 'h', @decrypt.decrypt_letter('k', 3)

    assert_equal 'e', @decrypt.decrypt_letter('e', 27)
    assert_equal 'l', @decrypt.decrypt_letter('d', 73)
    assert_equal 'l', @decrypt.decrypt_letter('e', 20)
    assert_equal 'o', @decrypt.decrypt_letter('r', 3)
    assert_equal ' ', @decrypt.decrypt_letter(' ', 27)
    assert_equal 'w', @decrypt.decrypt_letter('o', 73)
    assert_equal 'o', @decrypt.decrypt_letter('h', 20)
    assert_equal 'r', @decrypt.decrypt_letter('u', 3)
    assert_equal 'l', @decrypt.decrypt_letter('l', 27)
    assert_equal 'd', @decrypt.decrypt_letter('w', 73)
  end

  def test_decrypt_string_can_ecrypt_entire_string
    assert_equal "hello world", @decrypt.decrypt_string

  end
end
