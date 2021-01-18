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

  def rotate_letter(letter, shift)
    if letter != '\n'
      alphabet_letter_with_index = @alphabet.each_with_index.select do |alphabet_letter, index|
        alphabet_letter == letter
      end.flatten!
      shift_by = (alphabet_letter_with_index[1] + shift) % 27
      @alphabet[shift_by]
    else
    end
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
        else counter == 3
          decrypted_string += decrypt_letter(char, total_shift[3])
        end
        counter += 1
        if counter == 4
          counter = 0
        end
      end
      decrypted_string
    end

    def rotate_string
        counter = 0
        new_string = ''
        split_string = string.split('')
        split_string.each do |char|
          if counter == 0
            new_string += rotate_letter(char, total_shift[0])
          elsif counter == 1
            new_string += rotate_letter(char, total_shift[1])
          elsif counter == 2
            new_string += rotate_letter(char, total_shift[2])
          else counter == 3
            new_string += rotate_letter(char, total_shift[3])
          end
          counter += 1
          if counter == 4
            counter = 0
          end
        end
        new_string
      end




end
