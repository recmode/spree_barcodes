Spree::Variant.class_eval do
    has_many :barcodes,   dependent: :destroy
    self.whitelisted_ransackable_associations = %w[barcodes option_values product prices default_price]
end
