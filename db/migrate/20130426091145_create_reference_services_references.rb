class CreateReferenceServicesReferences < ActiveRecord::Migration
  def up
    create_table :reference_services_references, :id => false do |t|
      t.references :reference, :reference_service
    end

    add_index :reference_services_references, :reference_id
    add_index :reference_services_references, :reference_service_id
  end

  def down
    drop_table :reference_services_references
  end
end
