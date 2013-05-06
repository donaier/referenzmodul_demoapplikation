require 'spec_helper'

describe ReferenceAsset do
  describe '#new' do
    before do
      @reference = Fabricate(:reference)
    end

    context 'position' do
      it 'assigns the next free position to a new reference_asset' do
        Fabricate(:'ReferenceAssets::ReferenceImage', :position => 3, :reference => @reference)
        ReferenceAsset.new(:reference_id => @reference.id).position.should eq(4)
      end

      it 'assigns the first position if no other reference_assets are present' do
        ReferenceAsset.new(:reference_id => @reference.id).position.should eq(1)
      end
    end

    context 'valid video source' do
      #todo implement specs when video assets are fully functional
    end
  end
end
