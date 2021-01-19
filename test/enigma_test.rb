require_relative 'test_helper'

class EngimaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt_and_return_hash
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_calling_encrypt_assigns_values
    @enigma.encrypt("hello world", "02715", "040895")

    assert_equal 'hello world', @enigma.string
    assert_equal "02715", @enigma.key
    assert_equal "040895", @enigma.date
    assert_equal (("a".."z").to_a << " "), @enigma.alphabet
  end

  def test_calling_decrypt_assigns_values
    @enigma.decrypt("keder ohulw", "02715", "040895")

    assert_equal "keder ohulw", @enigma.string
    assert_equal "02715", @enigma.key
    assert_equal "040895", @enigma.date
    assert_equal (("a".."z").to_a << " "), @enigma.alphabet
  end

  def test_keys_array_converts_key_string_into_array
    @enigma.encrypt("hello world", "02715", "040895")

    assert_equal [2, 27, 71, 15], @enigma.keys_array
  end

  def test_offsets_array_converts_date_string_into_array
    @enigma.encrypt("hello world", "02715", "040895")

    assert_equal [1, 0, 2, 5], @enigma.offsets_array
  end

  def test_total_shift_sums_keys_and_offsets
    @enigma.encrypt("hello world", "02715", "040895")

    assert_equal [3, 27, 73, 20], @enigma.total_shift
  end

  def test_random_five_returns_random_number
    enigma = mock
    enigma.stubs(:random_five).returns('04781')
    assert_equal '04781', enigma.random_five
  end

  def test_given_no_key_it_will_generate_one
    expected = {
                date: "040895"
                }

    assert_equal expected[:date], @enigma.encrypt("hello world", "040895")[:date]
  end



  def test_encrypt_can_shift_a_letter
    @enigma.encrypt("hello world", "02715", "040895")

    assert_equal 'k', @enigma.encrypt_letter('h', 3)
    assert_equal 'e', @enigma.encrypt_letter('e', 27)
    assert_equal 'd', @enigma.encrypt_letter('l', 73)
    assert_equal 'e', @enigma.encrypt_letter('l', 20)
    assert_equal 'r', @enigma.encrypt_letter('o', 3)
    assert_equal ' ', @enigma.encrypt_letter(' ', 27)
    assert_equal 'o', @enigma.encrypt_letter('w', 73)
    assert_equal 'h', @enigma.encrypt_letter('o', 20)
    assert_equal 'u', @enigma.encrypt_letter('r', 3)
    assert_equal 'l', @enigma.encrypt_letter('l', 27)
    assert_equal 'w', @enigma.encrypt_letter('d', 73)
  end

  def test_decrypt_letter_can_decrypt_a_letter
    assert_equal 'h', @enigma.decrypt_letter('k', 3)
    assert_equal 'e', @enigma.decrypt_letter('e', 27)
    assert_equal 'l', @enigma.decrypt_letter('d', 73)
    assert_equal 'l', @enigma.decrypt_letter('e', 20)
    assert_equal 'o', @enigma.decrypt_letter('r', 3)
    assert_equal ' ', @enigma.decrypt_letter(' ', 27)
    assert_equal 'w', @enigma.decrypt_letter('o', 73)
    assert_equal 'o', @enigma.decrypt_letter('h', 20)
    assert_equal 'r', @enigma.decrypt_letter('u', 3)
    assert_equal 'l', @enigma.decrypt_letter('l', 27)
    assert_equal 'd', @enigma.decrypt_letter('w', 73)
  end

  def test_it_can_decrypt
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encrypt_a_message_with_a_key_using_todays_date
    expected = {
                encryption: "pefaw qdzly",
                key: "02715",
                date: "011821"
                }

    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_decrypt_a_message_with_a_key_using_todays_date
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "011821"
                }
    assert_equal expected, @enigma.decrypt('pefaw qdzly', "02715")
  end

  def test_encrypt_a_message_generates_random_key_and_uses_todays_date
    expected = {
                encryption: "ahgudnesi",
                key: "02715",
                date: "011821"
                }
    encryption = mock
    encryption.stubs(:encrypt).returns(expected).with('hey there')

    assert_equal expected, encryption.encrypt('hey there')
  end
end
