require "test/unit"
require "hamming"

class HammingTest < Test::Unit::TestCase
  def test_encodage_decodage_quartet
    0.upto(15) do | i |
      assert_equal(i, decode_quartet(encode_quartet(i)))
    end
  end

  def test_encodage_decodage_unsigned_byte
    0.upto(255) do | i |
      assert_equal(i, decode_unsigned_bytes(encode_unsigned_byte(i)))
    end
  end

  def test_quartet_to_byte
    0.upto(255) do | i |
      assert_equal(i, quartets_to_byte(unsigned_byte_to_quartets(i)))
    end
  end

  def test_encodage_decodage_str
    assert_equal("toto", decode_bin_str(encode_bin_str("toto")))
  end

  def test_encodage_decodage_bruit
    0.upto(15) do | i |
      puts "Test sur " + i.to_s(2)
      quartet_encode = encode_quartet(i)
      masque = 1
      8.times do 
        octet_avec_erreur = quartet_encode ^ masque
	puts "decodage de" + octet_avec_erreur.to_s(2)
        assert_equal(i, decode_quartet(octet_avec_erreur))
        masque = masque << 1
      end
    end
end      
end

