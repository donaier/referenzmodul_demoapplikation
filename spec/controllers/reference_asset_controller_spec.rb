require 'spec_helper'

describe Cms::ReferenceAssetsController do

  context '#destroy' do
    before do
      @reference = Fabricate(:reference)
      @reference_asset = Fabricate(:'ReferenceAssets::ReferenceImage', :reference => @reference)
    end

    it 'deactivates the reference if it has no assets left' do
      expect do
        delete :destroy, :reference_id => @reference, :id => @reference_asset
      end.to change{ @reference.reload.status }.from('active').to('inactive')
    end

    it 'does not touch the reference, if other assets are still present' do
      Fabricate(:'ReferenceAssets::ReferenceImage', :reference => @reference)
      expect do
        delete :destroy, :reference_id => @reference, :id => @reference_asset
      end.not_to change{ @reference.reload.status }
    end
  end
end
