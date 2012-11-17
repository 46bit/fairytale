Gem::Specification.new do |s|
  s.name        = 'fairytale'
  s.version     = '1.0.0-dev'
  s.date        = '2012-11-17'
  s.summary     = "Sinatra-like static site compiler."
  s.description = "Sinatra is awesome for building sites. Fairytale brings its power and freedom to static site compilation."
  s.authors     = ["Michael Mokrysz"]
  s.email       = "hi@46bit.com"
  s.files       = ["lib/fairytale.rb", "lib/fairytale/helpers.rb"]
  s.homepage    = "http://rubygems.org/gems/fairytale"

  s.add_dependency "tilt", "~> 1.3.3"
  s.add_dependency "sanitize", "~> 2.0.3"
end
