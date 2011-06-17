require "test/unit"
require "hamming"

class HammingTest < Test::Unit::TestCase
  def test_encodage_decodage
    ham = Hamming.new
    0.upto(15) do | i |
      assert_equal(ham.decodeQuartet(ham.encodeQuartet(i)), i)
    end
  end
end
