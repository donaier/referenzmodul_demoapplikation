class Cms::ReferenceServicesController < Kuhsaft::Cms::AdminController
  # GET /cms/reference_services
  # GET /cms/reference_services.json
  def index
    @cms_reference_services = ReferenceService.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cms_reference_services }
    end
  end

  # GET /cms/reference_services/new
  # GET /cms/reference_services/new.json
  def new
    @cms_reference_service = ReferenceService.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cms_reference_service }
    end
  end

  # GET /cms/reference_services/1/edit
  def edit
    @cms_reference_service = ReferenceService.find(params[:id])
  end

  # POST /cms/reference_services
  # POST /cms/reference_services.json
  def create
    @cms_reference_service = ReferenceService.new(params[:reference_service])

    respond_to do |format|
      if @cms_reference_service.save
        format.html { redirect_to cms_reference_services_url, notice: t('cms.create.success', name: ReferenceService.model_name.human) }
        format.json { render json: @cms_reference_service, status: :created, location: cms_reference_services_url }
      else
        format.html { render action: "new" }
        format.json { render json: @cms_reference_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cms/reference_services/1
  # PUT /cms/reference_services/1.json
  def update
    @cms_reference_service = ReferenceService.find(params[:id])

    respond_to do |format|
      if @cms_reference_service.update_attributes(params[:reference_service])
        format.html { redirect_to cms_reference_services_url, notice: t('cms.update.success', name: ReferenceService.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cms_reference_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/reference_services/1
  # DELETE /cms/reference_services/1.json
  def destroy
    @cms_reference_service = ReferenceService.find(params[:id])
    @cms_reference_service.destroy

    respond_to do |format|
      format.html { redirect_to cms_reference_services_url }
      format.json { head :no_content }
    end
  end
end
