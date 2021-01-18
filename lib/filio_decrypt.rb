require 'enigma'


handle = File.open(ARGV[0], 'r')

text_to_decrypt = handle.read
handle.close
@enigma = Enigma.new

decrypted_text = @enigma.decrypt(text_to_decrypt)

writer = File.open(ARGV[1], 'w')
writer.write(decrypted_text.txt)
writer.close
