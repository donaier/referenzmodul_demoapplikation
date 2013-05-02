class Cms::ReferenceAssetsController < Kuhsaft::Cms::AdminController

  def new
    @cms_reference_asset = ReferenceAsset.new(:reference_id => params[:reference_id], :type => params[:type])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cms_reference_asset }
    end
  end

  def create
    @cms_reference_asset = ReferenceAsset.new(params[:reference_asset])

    respond_to do |format|
      if @cms_reference_asset.save
        format.html { redirect_to cms_reference_path(@cms_reference_asset.reference), notice: t('cms.create.success', name: ReferenceAsset.model_name.human) }
        format.json { render json: @cms_reference_asset, status: :created, location: cms_reference_path(@cms_reference_asset.reference) }
      else
        format.html { render action: "new" }
        format.json { render json: @cms_reference_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @cms_reference_asset = ReferenceAsset.find(params[:id])
  end

  def update
    @cms_reference_asset = ReferenceAsset.find(params[:id])

    respond_to do |format|
      if @cms_reference_asset.update_attributes(params[:reference_asset])
        format.html { redirect_to cms_reference_path(@cms_reference_asset.reference), notice: t('cms.update.success', name: ReferenceAsset.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cms_reference_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cms_reference_asset = ReferenceAsset.find(params[:id])
    @cms_reference_asset.destroy

    # deactivate a reference if all assets are deleted
    if @cms_reference_asset.reference.main_asset == nil && @cms_reference_asset.reference.status == 'active'
      @cms_reference_asset.reference.update_attribute(:status, 'inactive')
    end

    respond_to do |format|
      format.html { redirect_to cms_reference_path(@cms_reference_asset.reference) }
      format.json { head :no_content }
    end
  end
end
