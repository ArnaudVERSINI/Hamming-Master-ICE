require "test/unit"
require "hamming"

class HammingTest < Test::Unit::TestCase
  def test_encodage_decodage_quartet
    ham = Hamming.new
    0.upto(15) do | i |
      assert_equal(i, ham.decodeQuartet(ham.encodeQuartet(i)))
    end
  end

  def test_encodage_decodage_unsigned_byte
    ham = Hamming.new
    0.upto(255) do | i |
      assert_equal(i, ham.encodeUnsignedByte(ham.decodeUnsignedByte(i)))
    end
  end

  def test_quartetToByte
    ham = Hamming.new
    0.upto(255) do | i |
      assert_equal(i, ham.quartetsToByte(ham.unsignedByteToQuartets(i)))
    end
  end
end

