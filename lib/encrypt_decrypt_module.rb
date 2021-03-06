module EncryptDecrypt

  def total_shift
    counter = 0
    accumulator = []
    keys_array.each do |key|
      accumulator << key += offsets_array[counter]
      counter += 1
    end
    accumulator
  end

  def decrypt_letter(letter, shift)
    alphabet_letter_with_index = @alphabet.each_with_index.select do |alphabet_letter, index|
      alphabet_letter == letter
    end.flatten!
    unshift_by = (alphabet_letter_with_index[1] - shift) % 27
    @alphabet[unshift_by]
  end

  def encrypt_letter(letter, shift)
    alphabet_letter_with_index = @alphabet.each_with_index.select do |alphabet_letter, index|
      alphabet_letter == letter
    end.flatten!
    shift_by = (alphabet_letter_with_index[1] + shift) % 27
    @alphabet[shift_by]
  end

  def decrypt_string
    counter = 0
    decrypted_string = ''
    string.split('').each do |char|
      if counter == 0
        decrypted_string += decrypt_letter(char, total_shift[0])
      elsif counter == 1
        decrypted_string += decrypt_letter(char, total_shift[1])
      elsif counter == 2
        decrypted_string += decrypt_letter(char, total_shift[2])
      else #counter == 3
        decrypted_string += decrypt_letter(char, total_shift[3])
      end
      counter += 1
      if counter == 4
        counter = 0
      end
    end
    decrypted_string
  end

  def encrypt_string
    counter = 0
    encrypted_string = ''
    split_string = string.split('')
    split_string.each do |char|
      if counter == 0
        encrypted_string += encrypt_letter(char, total_shift[0])
      elsif counter == 1
        encrypted_string += encrypt_letter(char, total_shift[1])
      elsif counter == 2
        encrypted_string += encrypt_letter(char, total_shift[2])
      else #counter == 3
        encrypted_string += encrypt_letter(char, total_shift[3])
      end
      counter += 1
      if counter == 4
        counter = 0
      end
    end
    encrypted_string
  end

  def keys_array
    @key.split('').each_cons(2).map do |x|
      x.join.to_i
    end
    # string.map do |string|
    #   string.to_i
    # end
  end

  def offsets_array
    date_to_int = @date.to_i
    square = date_to_int ** 2
    square_to_s = square.to_s.rjust(4, '0')
    last_4 = square_to_s[-4..-1].split('')
    last_4.map do |string|
      string.to_i
    end
  end
end
