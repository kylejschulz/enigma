require_relative './enigma'

@fileio = FileIO.new(ARGV[0], ARGV[1])

@fileio.open_read_close
encryption = @fileio.enigma.encrypt(@fileio.read_handle)
@fileio.open_writer
@fileio.write_writer(encryption)
@fileio.close_writer


puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
