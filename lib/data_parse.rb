module DataParse

  def random_five
    five = rand(0..99999).to_s.rjust(5, '0')
  end

  def date_gen
     Time.now.strftime('%m%d%y')
  end

  def sanitize_encrypt
    if arg2.length == 5
      @hash[:key] = arg2
      @hash[:date] = date_gen
    elsif arg2.length == 6
      @hash[:date] = arg2
      @hash[:key] = random_five
    else
      @hash[:date] = date_gen
      @hash[:key] = random_five
    end
      @hash[:encryption] = string
  end

  def sanitize_decrypt
    @hash[:decryption] = string
    @hash[:key] = key
    @hash[:date] = date
  end

  def keys_array
    string = @key.split('').each_cons(2).map do |x|
      x.join
    end
    to_int = string.map do |string|
      string.to_i
    end
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
