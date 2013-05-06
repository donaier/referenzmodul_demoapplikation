class CreateReferenceServices < ActiveRecord::Migration
  def change
    create_table :reference_services do |t|
      t.string :name
      t.text :text

      t.timestamps
    end
  end
end
