class ReferenceTopicCategory < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name

  has_many :reference_topics, :dependent => :destroy
end
