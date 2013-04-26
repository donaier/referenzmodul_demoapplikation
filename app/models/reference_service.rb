class ReferenceService < ActiveRecord::Base
  attr_accessible :name, :text

  has_and_belongs_to_many :references
end
