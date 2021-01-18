require_relative './enigma'
# require './lib/encrypt'
# require './lib/decrypt'

@enigma = Enigma.new
handle = File.open(ARGV[0], 'r')

text_to_encrypt = handle.read.downcase.strip
handle.close

encrypted_text = @enigma.encrypt(text_to_encrypt)
require "pry"; binding.pry

writer = File.open(ARGV[1], 'w')
writer.write(encrypted_text)
writer.close
