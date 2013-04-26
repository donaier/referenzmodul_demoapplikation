class CreateReferenceTopicCategories < ActiveRecord::Migration
  def change
    create_table :reference_topic_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
