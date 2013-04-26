class ReferenceTopic < ActiveRecord::Base
  attr_accessible :name, :reference_topic_category_id, :text

  validates_presence_of :name, :reference_topic_category_id, :text

  belongs_to :reference_topic_category
end
