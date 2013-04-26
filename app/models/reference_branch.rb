class ReferenceBranch < ActiveRecord::Base
  attr_accessible :name, :text

  validates_presence_of :name, :text

  has_and_belongs_to_many :references
end
