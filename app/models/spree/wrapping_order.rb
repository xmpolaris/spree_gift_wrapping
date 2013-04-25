class Spree::WrappingOrder < ActiveRecord::Base
  attr_accessible :order_id, :order, :gift_wrapping

  after_save :ensure_correct_adjustment, :update_order

  validates_presence_of :gift_wrapping
  validates_presence_of :order

  Spree::Shipment

  belongs_to :order
  belongs_to :gift_wrapping

  has_one :adjustment, :as => :source, :dependent => :destroy

  def line_items
    if order.complete? and Spree::Config[:track_inventory_levels]
      order.line_items.select { |li| inventory_units.map(&:variant_id).include?(li.variant_id) }
    else
      order.line_items
    end
  end

  def ensure_correct_adjustment
    if adjustment
      adjustment.originator = gift_wrapping
      adjustment.label = gift_wrapping.adjustment_label
      adjustment.save
    else
      gift_wrapping.create_adjustment(gift_wrapping.adjustment_label, order, self, true)
      reload #ensure adjustment is present on later saves
    end
  end

  def update_order
    order.update!
  end
end
