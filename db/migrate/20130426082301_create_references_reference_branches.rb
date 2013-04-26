class CreateReferencesReferenceBranches < ActiveRecord::Migration
  def up
    create_table :reference_branches_references, :id => false do |t|
      t.references :reference, :reference_branch
    end

    add_index :reference_branches_references, :reference_id
    add_index :reference_branches_references, :reference_branch_id
  end

  def down
    drop_table :reference_branches_references
  end
end
