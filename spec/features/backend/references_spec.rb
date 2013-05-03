# encoding: utf-8

require 'spec_helper'

describe Reference do
  context '#new' do
    before do
      visit cms_references_path
      click_on 'Neue Referenz'
    end

    it 'displays the reference form' do
      page.should have_selector('form#new_reference')
    end

    context 'with valid attributes' do
      before do
        fill_in('Titel', :with => 'Titel')
        fill_in('reference_customer', :with => 'Kunde')
        click_on('Create Referenz')
      end

      it 'saves a valid reference' do
        Reference.count.should eq(1)
      end

      it 'redirects to the detail view of a reference after creating it' do
        current_path.should eq(cms_reference_path(Reference.all.first))
      end
    end

    context 'with invalid attributes' do
      before do
        fill_in('reference_customer', :with => 'Kunde')
        click_on('Create Referenz')
      end

      it 'does not save a invalid reference' do
        Reference.count.should eq(0)
      end

      it 'renders the invalid form with highlighted fields' do
        page.should have_selector('div.reference_title.error')
      end
    end
  end

  context 'reference image' do

    context '#new' do
      before do
        @reference = Fabricate(:reference)
        visit new_cms_reference_reference_asset_path(@reference, :type => ReferenceAsset::TYPE_IMAGE)
      end

      it 'saves a valid reference image' do
        attach_file 'Datei', "#{Rails.root}/spec/support/test_files/test_image.jpg"
        choose('small')
        expect {
          click_on 'Create Reference asset'
        }.to change{ReferenceAsset.count}.by(1)
      end

      it 'does not save a invalid reference image' do
        expect {
          click_on 'Create Reference asset'
        }.not_to change{ReferenceAsset.count}
      end

      it 'displays an error message if the image format is invalid' do
        attach_file 'Datei', "#{Rails.root}/spec/support/test_files/test_document.pdf"
        choose('small')
        click_on 'Create Reference asset'
        page.should have_selector('.reference_asset_asset.error')
      end
    end

    context '#index' do
      it 'displays a preview of the reference image' do
        @reference = Fabricate(:reference)
        @asset = Fabricate(:'ReferenceAssets::ReferenceImage', :reference => @reference)
        visit cms_reference_path(@reference)
        find('img')[:alt].should eq('Small_test_image')
      end
    end
  end

  context '#edit' do
    before do
      @reference = Fabricate(:reference)
      visit cms_references_path
      click_on 'Bearbeiten'
    end

    it 'displays the reference form' do
      page.should have_selector("form#edit_reference_#{@reference.id}")
    end

    context 'with valid attributes' do
      before do
        fill_in('Titel', :with => 'New Title')
        click_on('Update Referenz')
      end

      it 'updates a reference with valid attributes' do
        @reference.reload.title.should eq('New Title')
      end

      it 'rediects to the detail view of a updated reference' do
        current_path.should eq(cms_reference_path(@reference))
      end
    end

    context 'vith invalid attributes' do
      before do
        fill_in('Titel', :with => '')
        click_on('Update Referenz')
      end

      it 'does not update a reference with invalid attributes' do
        @reference.reload.title.should eq('Titel 1')
      end

      it 'renders the invalid form with highlighted fields' do
        page.should have_selector('div.reference_title.error')
      end
    end
  end

  context 'activate' do
    before do
      @reference = Fabricate(:reference, :status => 'inactive')
      Fabricate(:'ReferenceAssets::ReferenceImage', :reference => @reference)
      @active_reference = Fabricate(:reference)
      @inactive_reference = Fabricate(:reference, :status => 'inactive')
    end

    it 'activates a reference' do
      visit cms_reference_path(@reference)
      expect {
        find('a.activator').click
      }.to change{@reference.reload.status}.to('active')
    end

    it 'deactivates a reference' do
      visit cms_reference_path(@active_reference)
      expect {
        find('a.deactivator').click
      }.to change{@active_reference.reload.status}.to('inactive')
    end

    it 'is not possible to activate a reference if it has no assets' do
      visit cms_reference_path(@inactive_reference)
      find('a.deactivator').should
    end
  end

  context '#delete' do
    before do
      @reference = Fabricate(:reference)
      Fabricate(:'ReferenceAssets::ReferenceImage', :reference => @reference)
      visit cms_references_path
    end

    it 'asks for confirmation before deleting' do
      find_link('Löschen')[:'data-confirm'].should eq('sind sie sicher?')
    end

    it 'deletes all associated assets' do
      @reference.destroy
      @reference.reference_assets.should be_empty
    end
  end
end
