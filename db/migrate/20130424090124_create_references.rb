class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :title
      t.string :page_url
      t.string :customer
      t.integer :year
      t.text :short_description
      t.text :description
      t.integer :position
      t.string :customer_url
      t.string :testimonial_company
      t.string :testimonial_person
      t.text :testimonial_quote
      t.boolean :showcase
      t.integer :showcase_position
      t.string :status

      t.timestamps
    end
  end
end
