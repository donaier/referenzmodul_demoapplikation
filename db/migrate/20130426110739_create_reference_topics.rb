class CreateReferenceTopics < ActiveRecord::Migration
  def change
    create_table :reference_topics do |t|
      t.integer :reference_topic_category_id
      t.string :name
      t.text :text

      t.timestamps
    end
  end
end
