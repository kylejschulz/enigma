require 'enigma'

handle = File.open(ARGV[0], 'r')

text_to_encrypt = handle.read.downcase
handle.close
@enigma = Enigma.new

encrypted_text = @enigma.encrypt(text_to_encrypt)

writer = File.open(ARGV[1], 'w')
writer.write(encrypted_text.txt)
writer.close
