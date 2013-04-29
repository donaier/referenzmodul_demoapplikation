class Reference < ActiveRecord::Base

  REFERENCE_STATES = ['active', 'inactive', 'archive']

  attr_accessible :customer, :customer_url, :description, :page_url, :position,
  :short_description, :showcase, :showcase_position, :status,
  :testimonial_company, :testimonial_person, :testimonial_quote, :title, :year,
  :reference_branch_ids, :reference_service_ids, :reference_topic_ids

  validates_presence_of :title, :customer, :position, :status, :year

  has_many :reference_assets, :dependent => :destroy

  has_many :images, :class_name => ReferenceAssets::ReferenceImage
  has_many :videos, :class_name => ReferenceAssets::ReferenceVideo

  has_and_belongs_to_many :reference_branches
  has_and_belongs_to_many :reference_services
  has_and_belongs_to_many :reference_topics

  default_scope order('position')

  scope :showcase, where(:showcase => true).order('showcase_position ASC')
  scope :active, where(:status => 'active')

  after_initialize do
    assign_position
    assign_year
  end

  before_save do
    assign_showcase_position
  end

  def active?
    self.status == 'active'
  end

  def inactive?
    self.status == 'inactive'
  end

  def archive?
    self.status == 'archive'
  end

  def main_asset
    self.reference_assets.where(:main_asset => true).first
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
