require_relative './enigma'

@fileio = FileIO.new(ARGV[0], ARGV[1])

@fileio.open_read_close
@fileio.enigma.encrypt(@fileio.read_handle)
@fileio.open_writer 


text_to_encrypt = handle.read.downcase.strip.chomp
handle.close

encrypted_text = @enigma.encrypt(text_to_encrypt)
writer = File.open(ARGV[1], 'w')
writer.write(encrypted_text)
writer.close
puts "Created '#{ARGV[1]}' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
