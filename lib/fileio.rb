require_relative 'enigma'
class FileIO
  attr_reader :read, :write, :key, :date, :enigma
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
    open_handle.read.strip.downcase
  end

  def close_handle
    open_handle.close
  end

  #encrypt or decrypt

  def open_writer
    File.open(@write, 'w')
  end

  def  write_writer(encryption_or_decryption)
    open_writer.write()
  end

  def close_writer
    writer.close
  end
# encrypted_text = @enigma.encrypt(text_to_encrypt)
end
