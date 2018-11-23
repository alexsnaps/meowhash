require 'meowhash/meowhash'
require "base64"

module MeowHash
  module Hasher
    def self.hexdigest(to_hash)
        digest(to_hash).each_byte.map { |b| b.to_s(16).rjust(2,'0') }.join
    end

    def self.base64digest(to_hash)
        Base64.encode64(digest(to_hash)).strip
    end
  end
end
