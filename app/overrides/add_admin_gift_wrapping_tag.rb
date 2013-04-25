Deface::Override.new(:virtual_path  => "spree/layouts/admin",
                     :name          => "spree_gift_wrapping_admin_tabs",
                     :erb           => "<%= tab :gift_wrappings, :icon => 'icon-gift'  %>",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :disabled      => false)

