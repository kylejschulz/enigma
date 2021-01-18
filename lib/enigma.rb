require 'time'
require './lib/encrypt'
require './lib/decrypt'
class Enigma
  attr_accessor :hash
  def initialize
    @hash = Hash.new
  end


  def random_five
    five = rand(0..99999).to_s.rjust(5, '0')
  end

  def encrypt(string, arg2 = '', arg3 = '')
    if arg2.length == 5
      @hash[:key] = arg2
      @hash[:date] = date_gen
    elsif arg2.length == 6
      @hash[:date] = arg2
      @hash[:key] = random_five
    else
      @hash[:date] = date_gen
      @hash[:key] = random_five
    end
      @hash[:encryption] = string
      Encrypt.new(@hash)
  end

  def date_gen
     Time.now.strftime('%m%d%y')
  end

  def decrypt(string, key, date = date_gen)
    @hash[:decryption] = string
    @hash[:key] = key
    @hash[:date] = date
    Decrypt.new(@hash)
  end
end
