module DataParse
  def random_five
    five = rand(0..99999).to_s.rjust(5, '0')
  end

  def date_gen
     Time.now.strftime('%m%d%y')
  end

  def sanitize_encrypt(string, arg2, arg3)
    if arg2.length == 5 && arg3.length == 6
      @key = arg2
      @date = arg3
    elsif arg2.length == 5
      @key = arg2
      @date = date_gen
    elsif arg2.length == 6
      @date = arg2
      @key = random_five
    else
      @date = date_gen
      @key = random_five
    end
      @string = string.downcase.strip
  end

  def sanitize_decrypt(string, key, date)
    if date.length != 6
      date = date_gen
    end
    @key = key
    @date = date
    @string = string.downcase.strip
  end
end
