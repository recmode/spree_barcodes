class CreateSpreeBarcodes < ActiveRecord::Migration
  def change
    create_table :spree_barcodes do |t|
      t.string     :code
      t.string     :format
      t.references :variant
      t.references :product
      t.integer    :position

      t.timestamps null: true
    end
  end
end
