Spree::AppConfiguration.class_eval do
  # Request instructions/info for wrapping
  # share with shipping special instructions
  preference :wrapping_instructions, :boolean, :default => false
end

