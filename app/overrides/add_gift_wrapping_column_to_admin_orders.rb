Deface::Override.new(:virtual_path => "spree/admin/orders/index",
                     :name => 'add_gift_wrapping_column_to_admin_orders_table',
                     :erb => "<td class=\"align-center\"><%= order.gift_wrapping.try{|g| link_to 'Gift Wrapping', admin_gift_wrapping_path(g)} %></td>",
                     :insert_before => "td[data-hook='admin_orders_index_row_actions']")

Deface::Override.new(:virtual_path => "spree/admin/orders/index",
                     :name => 'add_gift_wrapping_header_to_admin_orders_table',
                     :erb => "<th>Wrapping</th>",
                     :insert_before => "th[data-hook='admin_orders_index_header_actions']")

