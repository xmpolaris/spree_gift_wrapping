require "spree_gift_wrapping/engine"
require_dependency 'spree/core/environment_extension'
require_dependency 'spree/core/environment'
require_dependency 'spree/core/environment/calculators'

module SpreeGiftWrapping
end

Spree::Core::Environment::Calculators.class_eval do
  attr_accessor :gift_wrappings
end
