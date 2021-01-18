require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
class EngimaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt
    
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt
    skip
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encrypt_a_message_with_a_key_using_todays_date
    skip
    assert_equal expected, @encrypted = enigma.encrypt("hello world", "02715")
  end

  def test_decrypt_a_message_with_a_key_using_todays_date
    skip
    assert_equal expected, @enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_encrypt_a_message_generates_random_key_and_uses_todays_date
    skip
    @enigma.encrypt("hello world")
  end
end
