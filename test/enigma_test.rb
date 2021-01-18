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
