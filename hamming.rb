class Hamming
  def initialize()
    @matrice = [
	[1, 0, 0, 0],
	[0, 1, 0, 0],
	[0, 0, 1, 0],
	[0, 0, 0, 1],
	[1, 1, 0, 1],
	[1, 0, 1, 1],
	[0, 1, 1, 1]]

  @matriceEncodage = [
	0x00,
	0x71,
	0x62,
	0x13,
	0x54,
	0x25,
	0x36,
	0x47,
	0x38,
	0x49,
	0x5A,
	0x2B,
	0x6C,
	0x1D,
	0x0E,
	0x7F]

  @matriceDecodage = [
    0x00, 0x00, 0x00, 0x03, 0x00, 0x05, 0x0E, 0x07,
    0x00, 0x09, 0x0E, 0x0B, 0x0E, 0x0D, 0x0E, 0x0E,
    0x00, 0x03, 0x03, 0x03, 0x04, 0x0D, 0x06, 0x03,
    0x08, 0x0D, 0x0A, 0x03, 0x0D, 0x0D, 0x0E, 0x0D,
    0x00, 0x05, 0x02, 0x0B, 0x05, 0x05, 0x06, 0x05,
    0x08, 0x0B, 0x0B, 0x0B, 0x0C, 0x05, 0x0E, 0x0B,
    0x08, 0x01, 0x06, 0x03, 0x06, 0x05, 0x06, 0x06,
    0x08, 0x08, 0x08, 0x0B, 0x08, 0x0D, 0x06, 0x0F,
    0x00, 0x09, 0x02, 0x07, 0x04, 0x07, 0x07, 0x07,
    0x09, 0x09, 0x0A, 0x09, 0x0C, 0x09, 0x0E, 0x07,
    0x04, 0x01, 0x0A, 0x03, 0x04, 0x04, 0x04, 0x07,
    0x0A, 0x09, 0x0A, 0x0A, 0x04, 0x0D, 0x0A, 0x0F,
    0x02, 0x01, 0x02, 0x02, 0x0C, 0x05, 0x02, 0x07,
    0x0C, 0x09, 0x02, 0x0B, 0x0C, 0x0C, 0x0C, 0x0F,
    0x01, 0x01, 0x02, 0x01, 0x04, 0x01, 0x06, 0x0F,
    0x08, 0x01, 0x0A, 0x0F, 0x0C, 0x0F, 0x0F, 0x0F]
  end
  
  #Encode une chaine de caractére contenant des 0 et des 1
  def encodeBinStr (strToEncode)
    strToEncode.bytes.map{|i| encodeUnsignedByte(i)}.flatten.pack("c*")
  end

  #Decode une chaine de caractére contenant des 0 et des 1
  def decodeBinStr (strToDecode)
    strToDecode.bytes.each_slice(2).map{|i| decodeUnsignedBytes(i)}.pack("c*")
  end

  def encodeUnsignedByte(byteToEncode)
    quartets = unsignedByteToQuartets(byteToEncode)
    quartets.map! {|i| encodeQuartet(i)}
    quartets
  end

  def decodeUnsignedBytes(byteToEncode)
    quartets = byteToEncode.map {|i| decodeQuartet(i)}
    retvalue = quartetsToByte(quartets)
  end

  def unsignedByteToQuartets(byteToConvert)
    [(byteToConvert >> 4) & 0x0F, byteToConvert & 0x0F]
  end

  #Convertit deux quartets en un octet
  def quartetsToByte(quartetsToConvert)
    quartetsToConvert[1] | (quartetsToConvert[0] << 4)
  end

  #Decode une chaine de caractére contenant des 0 et des 1
  def encodeQuartet (quartetToEnccode)
    @matriceEncodage[quartetToEnccode]
  end

  #Decode une chaine de caractére contenant des 0 et des 1
  def decodeQuartet (octetToDecode)
    @matriceDecodage[octetToDecode]    
  end
end
