require 'time'
require_relative 'data_parse_module'
require_relative 'encrypt_decrypt_module'
class Enigma
  include DataParse
  include EncryptDecrypt
  attr_accessor :string,
                :key,
                :date
  def initialize
    @string = ''
    @key = ''
    @date = ''
    @alphabet = ("a".."z").to_a << " "
  end


  def encrypt(string, arg2 = '', arg3 = '')
    sanitize_encrypt(string, arg2, arg3)
    hash = Hash.new
    hash[:encryption] = encrypt_string
    hash[:key] = @key
    hash[:date] = @date
    hash
  end

  def decrypt(string, key, date = '')
    sanitize_decrypt(string, key, date )
    hash = Hash.new
    hash[:decryption] = decrypt_string
    hash[:key] = @key
    hash[:date] = @date
    hash
  end
end
