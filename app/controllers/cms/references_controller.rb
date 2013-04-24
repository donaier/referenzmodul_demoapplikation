class Cms::ReferencesController < Kuhsaft::Cms::AdminController
  # GET /cms/references
  # GET /cms/references.json
  def index
    @cms_references = Reference.all
    @cms_references_showcase = Reference.unscoped.showcase

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cms_references }
    end
  end

  # GET /cms/references/1
  # GET /cms/references/1.json
  def show
    @cms_reference = Reference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cms_reference }
    end
  end

  # GET /cms/references/new
  # GET /cms/references/new.json
  def new
    @cms_reference = Reference.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cms_reference }
    end
  end

  # GET /cms/references/1/edit
  def edit
    @cms_reference = Reference.find(params[:id])
  end

  # POST /cms/references
  # POST /cms/references.json
  def create
    @cms_reference = Reference.new(params[:reference])

    respond_to do |format|
      if @cms_reference.save
        format.html { redirect_to cms_reference_path(@cms_reference), notice: t('cms.create.success', name: Reference.model_name.human) }
        format.json { render json: @cms_reference, status: :created, location: cms_reference_path(@cms_reference) }
      else
        format.html { render action: "new" }
        format.json { render json: @cms_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cms/references/1
  # PUT /cms/references/1.json
  def update
    @cms_reference = Reference.find(params[:id])

    respond_to do |format|
      if @cms_reference.update_attributes(params[:reference])
        format.html { redirect_to cms_reference_path(@cms_reference), notice: t('cms.update.success', name: Reference.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cms_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/references/1
  # DELETE /cms/references/1.json
  def destroy
    @cms_reference = Reference.find(params[:id])
    @cms_reference.destroy

    respond_to do |format|
      format.html { redirect_to cms_references_url }
      format.json { head :no_content }
    end
  end
end
