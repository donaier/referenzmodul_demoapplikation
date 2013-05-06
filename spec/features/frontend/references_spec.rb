# encoding: utf-8

require 'spec_helper'

describe Reference do
  describe '#index' do
    context 'filtering' do
      before do
        ReferenceService.create(:name => 'TopicA', :text => 'text')
        ReferenceService.create(:name => 'TopicB', :text => 'text')
        @reference = Fabricate(:reference, :reference_services => [ReferenceService.first])
        Fabricate(:'ReferenceAssets::ReferenceImage', :reference => @reference)
        @reference2 = Fabricate(:reference, :title => 'TestReference')
        Fabricate(:'ReferenceAssets::ReferenceImage', :reference => @reference2)
      end

      it 'only shows the references matching the filter'

      it 'disables filter options with no result'
    end

    it 'redirects to the detail view when a reference is clicked' do
      @reference2 = Fabricate(:reference, :title => 'TestReference')
      Fabricate(:'ReferenceAssets::ReferenceImage', :reference => @reference2)

      visit references_path
      save_and_open_page
      click_on 'TestReference'
      current_path.should eq(reference_path(@reference2))
    end
  end
end
