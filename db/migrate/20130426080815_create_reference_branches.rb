class CreateReferenceBranches < ActiveRecord::Migration
  def change
    create_table :reference_branches do |t|
      t.string :name
      t.text :text

      t.timestamps
    end
  end
end
