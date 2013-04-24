class Reference < ActiveRecord::Base
  attr_accessible :customer, :customer_url, :description, :page_url, :position, :short_description, :showcase,
  :showcase_position, :status, :testimonial_company, :testimonial_person, :testimonial_quote, :title, :year

  scope :showcase, where(:showcase => true).order('showcase_position, position')

  default_scope order('position')
end
