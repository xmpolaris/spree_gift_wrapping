module SpreeGiftWrapping
  module Generators
    class MigrationGenerator < Rails::Generators::Base

      desc "Installs required migrations for spree_gift_wrapping"

      class_option :add_stylesheets, :type => :boolean, :default => true, :banner => "Append spree_gift_wrapping to store/all.css"

      def copy_migrations
        rake "spree_gift_wrapping:install:migrations"
      end

      def append_stylesheets
        return unless options[:add_stylesheets]
        gsub_file "app/assets/stylesheets/store/all.css", "*/", "*= require store/gift_wrapping\n*/"
      end

    end
  end
end