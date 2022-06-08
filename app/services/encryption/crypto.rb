module Encryption::Crypto
  def encrypt(file_obj)
    file_obj.blob.open do |tem|
      file = File.open(tem, "r")
      all_text = file.read
      file.close
      new_text = SymmetricEncryption.encrypt(all_text)
      File.open(tem, "w") {|file| file << new_text}
      file = File.open(tem)
      file_obj.attach(io: file, filename:  file_obj.blob.filename )
    end
  end

  def decrypt(file_obj)
    output_file =  File.open("#{file_obj.blob.filename}", "w")
    file_obj.blob.open do |tem|
      file = File.open(tem, "r")
      all_text = file.read
      file.close
      new_text = SymmetricEncryption.decrypt(all_text)
      File.open( output_file , "w") {|file| file << new_text}
    end
    output_file
  end
end
