Spree::Order.class_eval do
  attr_accessible :gift_wrapping_id

  belongs_to :gift_wrapping
  has_many :wrapping_orders, :dependent => :destroy

  checkout_flow do
    go_to_state :address
    go_to_state :delivery
    go_to_state :gift_wrapping
    go_to_state :payment, :if => lambda { |order|
      # Fix for #2191
      if order.shipping_method
        order.create_shipment!
        order.update_totals
      end
      order.payment_required?
    }
    go_to_state :confirm, :if => lambda { |order| order.confirmation_required? }
    go_to_state :complete, :if => lambda { |order| (order.payment_required? && order.payments.exists?) || !order.payment_required? }
    remove_transition :from => :delivery, :to => :confirm
  end

  state_machine :state, :initial => :cart do
    before_transition :from => :gift_wrapping,  :do => :clean_wrapping_order!
    after_transition :from => :gift_wrapping,  :do => :create_wrapping_order!
  end

  # Creates new gift wrapping charges if there are any applicable prices.
  def create_wrapping_order!
    if gift_wrapping
      self.wrapping_orders << Spree::WrappingOrder.create!(
        {
          :order => self,
          :gift_wrapping => gift_wrapping
        }, :without_protection => true)
    end
  end

  def clean_wrapping_order!
    self.wrapping_orders.destroy_all
  end

  def gift_wrapping_hash
    return @gift_wrapping_hash if @gift_wrapping_hash.present?

    # reserve one slot for each shipping method computation
    computed_costs = Array.new(Spree::GiftWrapping.all.size)

    # create all the threads and kick off their execution
    threads = Spree::GiftWrapping.all.each_with_index.map do |wrapping_method, index|
      Thread.new { computed_costs[index] = [wrapping_method, wrapping_method.calculator.compute(self)] }
    end

    # wait for all threads to finish
    threads.map(&:join)

    # now consolidate and memoize the threaded results
    @gift_wrapping_hash ||= computed_costs.map do |pair|
      wrapping_method, cost = *pair
      next unless cost
      Spree::GiftWrappingRate.new( :id => wrapping_method.id,
                                   :wrapping_method => wrapping_method,
                                   :description => wrapping_method.description,
                                   :image => wrapping_method.image.try{|img|img.attachment.url(:mini)},
                                   :cost => cost,
                                   :currency => currency)
    end.compact.sort_by { |r| r.cost }
  end
end