require 'spec_helper'

describe Spree::Barcode do
  describe "#format" do

    before(:each) do
      tax_category = Spree::TaxCategory.create
      @product = Spree::Product.create(tax_category: tax_category)
      @variant = Spree::Variant.create(is_master: true, product: @product, price: 10.0)
    end

    it "save the correct format (EAN)" do
      expected = Spree::Barcode.create(variant_id: @variant.id, product_id: @product.id, code: '9788499061733')
      expect(expected.format).to eq("EAN")
    end

    it "save the correct format (UPC)" do
      expected = Spree::Barcode.create(variant_id: @variant.id, product_id: @product.id, code: '768661113872')
      expect(expected.format).to eq("UPC")
    end

    it "save the correct format (Uknown)" do
      expected = Spree::Barcode.create(variant_id: @variant.id, product_id: @product.id, code: '123456789')
      expect(expected.format).to eq("Unknown")
    end

  end
end
