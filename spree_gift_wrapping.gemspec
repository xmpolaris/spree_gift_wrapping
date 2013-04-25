$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spree_gift_wrapping/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spree_gift_wrapping"
  s.version     = SpreeGiftWrapping::VERSION
  s.authors     = ["Chen ZhongXue"]
  s.email       = ["xmpolaris@gmail.com"]
  s.homepage    = "https://github.com/xmpolaris/spree_gift_wrapping"
  s.summary     = "Gift Wrapping extension for spree checkout."
  s.description = "Gift Wrapping extension for spree checkout."

  s.files = Dir["{app,config,lib,db}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency "rails", "~> 3.2.10"
  s.add_runtime_dependency "spree", "~> 1.3.0"
end
