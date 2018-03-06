
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "love_of_tea/version"

Gem::Specification.new do |spec|
  spec.name          = "love_of_tea"
  spec.version       = LoveOfTea::VERSION
  spec.authors       = ["Aveline Rose"]
  spec.email         = ["amouraveline@gmail.com"]

  spec.summary       = "Scrapes data from Rishi Tea website and pairs you with tea"
  spec.description   = "This application pairs you with teas scraped from the Rishi Tea website based on desired effect and caffeine level. It allows you to place teas in a cart and reference details and URLs for each tea to purchase. "
  spec.homepage      = "https://github.com/avelineamour/love_of_tea"
  spec.license       = "MIT"
  spec.files         = ["lib/love_of_tea/tea.rb", "lib/love_of_tea/scraper.rb", "lib/love_of_tea/cli.rb", "lib/love_of_tea/version.rb"]
 spec.executables   = ["loveoftea"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "require_all", "~> 1.5.0"
  spec.add_development_dependency "pry", "~> 1.9.3"
  spec.add_dependency "nokogiri"


end
