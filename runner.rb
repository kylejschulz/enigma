require './lib/enigma'
require "pry"; binding.pry
enigma = Enigma.new


enigma.encrypt('hello,  world', "02715",'062589')
require "pry"; binding.pry
# enigma.date_gen
# enigma.random_five
#
# puts enigma.key_gen(enigma.random_five)
#
# puts enigma.offset_gen(enigma.date_gen)
