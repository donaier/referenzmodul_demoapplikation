class Reference < ActiveRecord::Base

  REFERENCE_STATES = ['active', 'inactive', 'archive']

  attr_accessible :customer, :customer_url, :description, :page_url, :position,
  :short_description, :showcase, :showcase_position, :status,
  :testimonial_company, :testimonial_person, :testimonial_quote, :title, :year

  validates_presence_of :title, :customer, :position, :status, :year

  default_scope order('position')

  scope :showcase, where(:showcase => true).order('showcase_position ASC')

  after_initialize do
    assign_position
    assign_year
  end

  before_save do
    assign_showcase_position
  end

  private

  def assign_position
    self.position ||= Reference.any? ? Reference.maximum(:position).to_i + 1 : 1
  end

  def assign_year
    self.year ||= Time.now.year
  end

  def assign_showcase_position
    if self.showcase
      self.showcase_position ||= Reference.showcase.maximum(:showcase_position).to_i + 1
    end
  end
end