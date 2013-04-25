class Spree::GiftWrapping < ActiveRecord::Base
  attr_accessible :description, :image_attributes, :image

  validates_presence_of :description

  calculated_adjustments
  has_one :image, :as => :viewable, :class_name => Spree::Image

  accepts_nested_attributes_for :image

  def adjustment_label
    I18n.t(:gift_wrapping)
  end
end
