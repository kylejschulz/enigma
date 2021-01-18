 @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
  "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

  keys = [3, 27, 72, 20]
  offsets = [1, 0, 2, 5]

def join_keys_and_offsets(keys, offsets)
  counter = 0
  accumulator = []
  keys.each do |key|
    accumulator << key += offsets[counter]
    counter += 1
  end
end

  def shift(string, keys, offsets)
    join_keys_and_offsets(keys, offsets)
    string.split('').each_with_index do |string_letter, string_index|
      @alphabet.each_with_index.select do |alphabet_letter, alphabet_index|
      require "pry"; binding.pry
      end
      require "pry"; binding.pry
    end
  end
  # get first letter of string, iterate through alphabet, get

  def rotate(letter, number)
    #sets value of empty stirng
    new_string = ''
    #returns the alphabet letter with index
    what = @alphabet.each_with_index.select do |alphabet_letter, index|
      alphabet_letter == letter
    end.flatten!
    shift_by = what[1] + 6 % 27
    new_letter = @alphabet.each_with_index.select do |alphabet_letter, index|
      shift_by == index
    end.flatten!
    new_string += new_letter[0]
    require "pry"; binding.pry
  end
# shift("keder ohulw", keys, offsets)

rotate('a', 6)
