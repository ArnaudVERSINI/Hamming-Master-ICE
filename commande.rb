require "hamming"
require "bruit"

def help()
  puts "ruby COMMANDE fichier_entre fichier sortie"
  puts "ENCODE pour encoder"
  puts "DECODE pour decoder"
  puts "ERREUR pour générer des erreurs"
end

if (ARGV.length != 3)
  help()
  exit 1;
end

file_input = File.new(ARGV[1] ,"rb");
file_output = File.new(ARGV[2], "wb");
puts "Fichiers ouverts"
case (ARGV[0])
  when "ENCODE" then
    file_input.bytes.each{|i| file_output.write(encode_unsigned_byte(i).pack("c*"))}
  when "DECODE" then
    table_temp = []
    file_input.bytes.each do |i|
      table_temp.push i
      if (table_temp.length == 2)
        file_output.write([decode_unsigned_bytes(table_temp)].pack("c*"))
        table_temp.clear
      end
     end
  when "ERREUR" then
   bruit = Bruit.new
   file_input.bytes.each{|i| file_output.write([bruit.inserer_bruit(i)].pack("c*"))}
    
end
