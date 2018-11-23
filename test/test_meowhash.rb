require 'test/unit'
require 'meowhash'

class TestMeowHash < Test::Unit::TestCase
  def test_verison
    assert MeowHash::Hasher.version() == "v0.4"
  end

  def test_hasher
    assert_equal("0591045C3C3F33B515D7D2E366FBF082".downcase, MeowHash::Hasher.hash("toto").each_byte.map { |b| b.to_s(16).rjust(2,'0') }.join)
  end

  def test_raises_on_non_string
    assert_raise TypeError do
      MeowHash::Hasher.hash(42)
    end
  end
end