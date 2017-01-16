Spree::Admin::VariantsController.class_eval do
  private

  def variant_includes
    [{ option_values: :option_type }, :default_price, :barcodes]
  end
end
