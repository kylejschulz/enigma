require_relative './enigma'
require_relative 'fileio'
# ruby lib/encrypt.rb little_brother.txt just_encrypted.txt

@fileio = FileIO.new(ARGV[0], ARGV[1])

a = @fileio.open_handle
b = @fileio.read_handle
c = @fileio.close_handle
encryption = @fileio.enigma.encrypt(b)
f = @fileio.open_writer
g = @fileio.write_writer(encryption)
h = @fileio.close_writer


puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
