require 'enigma'
class FileIO
  attr_reader :read, :write, :key, :date
  def initialize(read, write, key = '', date = '')
    @read = read
    @write = write
    @key = key
    @date = date
    @enigma = Enigma.new

  end

  def open_handle
    File.open(@read, 'r')
  end

  def read_handle
    handle.read.downcase
  end

  def close_handle
    handle.close
  end

  #encrypt or decrypt

  def open_writer
    File.open(write, 'w')
  end

  def  write_writer
    writer.write(#)
  end

  def close_writer
    writer.close
  end
# encrypted_text = @enigma.encrypt(text_to_encrypt)
end
