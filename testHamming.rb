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
end

