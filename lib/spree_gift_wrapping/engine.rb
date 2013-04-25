module SpreeGiftWrapping
  class Engine < ::Rails::Engine
    isolate_namespace SpreeGiftWrapping

    initializer "spree.register.calculators_for_gift_wrappings" do |app|
      app.config.spree.calculators.gift_wrappings = [
        Spree::Calculator::FlatPercentItemTotal,
        Spree::Calculator::FlatRate,
        #Spree::Calculator::FlexiRate,
        Spree::Calculator::PerItem,
        #Spree::Calculator::PriceSack
      ]
    end

    config.to_prepare do
      Dir.glob File.expand_path("../../../app/**/*_decorator.rb", __FILE__) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Dir.glob File.expand_path("../../..//app/overrides/**/*.rb", __FILE__) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end
  end
end
