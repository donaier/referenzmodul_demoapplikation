require 'spec_helper'

describe Reference do
  describe '#new' do
    context 'position' do
      it 'assigns the next free position to a new reference' do
        Fabricate(:reference, :position => 3)
        Reference.new.position.should eq(4)
      end

      it 'assigns the first position if no other references are present' do
        Reference.new.position.should eq(1)
      end
    end

    context 'showcase_position' do
      it 'assigns the next free showcase position if showcase is checked' do
        Fabricate(:reference, :showcase => true, :showcase_position => 3)
        reference = Fabricate(:reference, :showcase => true)
        reference.showcase_position.should eq(4)
      end

      it 'assigns the first showcase position if no other showcase references are present' do
        reference = Fabricate(:reference, :showcase => true)
        reference.showcase_position.should eq(1)
      end

      it 'assigns no showcase position if showcase is not checked' do
        reference = Fabricate(:reference)
        reference.showcase_position.should be nil
      end
    end

    context 'year' do
      it 'assins the current year to a new reference' do
        Reference.new.year.should eq(Time.now.year)
      end
    end
  end

  context 'main_asset' do
    before do
      @reference = Fabricate(:reference)
      @reference_asset = Fabricate(:'ReferenceAssets::ReferenceImage', :reference => @reference)
    end

    it 'returns the first asset if no other is tagged as main' do
      @reference.main_asset.should eq(@reference_asset)
    end

    it 'returns the asset tagged as main' do
      @main_asset = Fabricate(:'ReferenceAssets::ReferenceImage', :reference => @reference, :main_asset => true)
      @reference.main_asset.should eq(@main_asset)
    end
  end

  context 'random_references' do
    before do
      @base_reference = Fabricate(:reference)
    end

    it 'returns nil if not enough other references are present' do
      Reference.random_three_excluding(@base_reference).should be nil
    end

    it 'does not return the reference specified to be excluded' do
      3.times do
        Fabricate(:reference)
      end
      Reference.random_three_excluding(@base_reference).should_not include(@base_reference)
    end
  end
end
