Gem::Specification.new do |s|
    s.name = 'meowhash'
    s.version = '0.4.0'
    s.summary = 'Meow Hash for Ruby'
    s.description = <<-DOC
      Meow Hash C extension for Ruby
    DOC
    s.homepage = 'https://github.com/alexsnaps/meowhash'
    s.authors = ['Alex Snaps']
    s.email   = ['alex.snaps@gmail.com']
    s.license = 'zlib'
  
    s.files = `git ls-files`.split("\n")
    s.extensions = ['ext/meowhash/extconf.rb']
    s.add_development_dependency 'rake-compiler', '~> 1.0'
    s.add_development_dependency 'test-unit'
  end
