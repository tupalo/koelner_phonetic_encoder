Gem::Specification.new do |gem|
  gem.name = 'koelner_phonetic_encoder'
  gem.version = '1.0.1'
  gem.authors = ['Michael Kohl', 'Anton Bangratz']
  gem.email = ['michi@tupalo.com', 'tony@tupalo.com']
  gem.summary = 'An implementation of the Kölner Phonetik phonetic algorithm'
  gem.homepage = 'https://github.com/tupalo/koelner_phonetic_encoder' 
  gem.require_paths = %w[lib]
  gem.files = Dir['lib/**/*.rb'] + Dir['spec/*.rb']
  gem.files += %w[README.mkd LICENSE Gemfile]
  gem.has_rdoc = false
end

