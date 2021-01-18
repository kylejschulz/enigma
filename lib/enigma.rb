require 'time'

class Enigma
  include DataParse
  include EncryptDecrypt
  attr_accessor :hash
  def initialize
    @hash = Hash.new
    @alphabet = ("a".."z").to_a << " "
  end


  def encrypt(string, arg2 = '', arg3 = '')
    sanitize_encrypt
  end

  def date_gen
     Time.now.strftime('%m%d%y')
  end

  def decrypt(string, key, date = date_gen)
    sanitize_decrypt
  end
end
