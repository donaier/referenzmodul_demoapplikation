class CreateReferenceTopicsReferences < ActiveRecord::Migration
  def up
    create_table :reference_topics_references, :id => false do |t|
      t.references :reference, :reference_topic
    end

    add_index :reference_topics_references, :reference_id
    add_index :reference_topics_references, :reference_topic_id
  end

  def down
    drop_table :reference_topics_references
  end
end
