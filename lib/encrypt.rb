require_relative './enigma'

@enigma = Enigma.new
handle = File.open(ARGV[0], 'r')

text_to_encrypt = handle.read.downcase.strip.chomp
handle.close

encrypted_text = @enigma.encrypt(text_to_encrypt)
writer = File.open(ARGV[1], 'w')
writer.write(encrypted_text)
writer.close
puts "Created '#{ARGV[1]}' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
