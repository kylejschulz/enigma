require_relative './enigma'

@enigma = Enigma.new
handle = File.open(ARGV[0], 'r')

text_to_decrypt = handle.read.downcase.strip.chomp
handle.close

decrypted_text = @enigma.decrypt(text_to_decrypt, ARGV[2], ARGV[3])
writer = File.open(ARGV[1], 'w')
writer.write(decrypted_text)
writer.close
puts "Created '#{ARGV[1]}' with the key #{decrypted_text[:key]} and date #{decrypted_text[:date]}"
