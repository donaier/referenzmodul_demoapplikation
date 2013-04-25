class ReferenceAsset < ActiveRecord::Base

  ASSET_SIZES = ['small', 'large']

  TYPE_IMAGE = 'ReferenceAssets::ReferenceImage'
  TYPE_VIDEO = 'ReferenceAssets::ReferenceVideo'

  attr_accessible :reference_id, :type, :position, :size, :text, :asset, :youtube, :href, :embed_code, :title, :main_asset

  mount_uploader :asset, ReferenceAssetUploader

  validates_presence_of :reference_id, :position, :size
  validates_presence_of :asset, :if => Proc.new{ |asset| asset.type == TYPE_IMAGE }
  validates_presence_of :title, :valid_source, :if => Proc.new{ |asset| asset.type == TYPE_VIDEO }

  belongs_to :reference

  default_scope order('position')

  after_initialize do
    assign_position
  end

  private

  def valid_source
    href.presence || embed_code.presence
  end

  def assign_position
    self.position ||= self.reference.reference_assets.maximum(:position).to_i + 1
  end
end
