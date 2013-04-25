class CreateReferenceAssets < ActiveRecord::Migration
  def change
    create_table :reference_assets do |t|
      t.integer :reference_id
      t.string :title
      t.boolean :main_asset, :default => false
      t.string :type
      t.integer :position
      t.string :size
      t.text :text
      t.string :asset
      t.boolean :youtube
      t.string :href
      t.text :embed_code

      t.timestamps
    end
  end
end
