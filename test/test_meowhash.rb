require 'test/unit'
require 'meowhash'

class TestMeowHash < Test::Unit::TestCase
  def test_verison
    assert MeowHash::Hasher.version() == "v0.4"
  end

  def test_hasher
    assert_equal("0591045C3C3F33B515D7D2E366FBF082".downcase, MeowHash::Hasher.digest("toto").each_byte.map { |b| b.to_s(16).rjust(2,'0') }.join)
  end

  def test_raises_on_non_string
    assert_raise TypeError do
      MeowHash::Hasher.digest(42)
    end
  end

  def test_meow_hash_version
    file = File.open("ext/meowhash/meow_hash.h", "rb")
    assert_equal("9F177F35D31536CDE904FF01EE0E9A72".downcase, MeowHash::Hasher.digest(file.read).each_byte.map { |b| b.to_s(16).rjust(2,'0') }.join)
  end

  def test_meow_intrinsics_version
    file = File.open("ext/meowhash/meow_intrinsics.h", "rb")
    assert_equal("B6F0D59805A037BFFC13AF959E08CC92".downcase, MeowHash::Hasher.digest(file.read).each_byte.map { |b| b.to_s(16).rjust(2,'0') }.join)
  end
end
