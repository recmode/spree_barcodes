require 'spec_helper'

describe Spree::Admin::BarcodesController, type: :controller do
  stub_authorization!
    let(:product) { create(:product) }
    let!(:variant) { create(:variant, product: product) }
    let!(:barcode_1) { create(:barcode, code:'9788499061733', product: product, variant: variant) }
    let!(:barcode_2) { create(:barcode, code:'768661113872', product: product, variant: variant) }


  describe "GET index" do
    it "assigns @barcodes" do
      spree_get :index, product_id: product.slug, variant_id: variant.id
      expect(assigns(:barcodes)).to eq(variant.barcodes)
    end
  end

end
