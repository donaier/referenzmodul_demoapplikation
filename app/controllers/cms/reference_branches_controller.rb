class Cms::ReferenceBranchesController < Kuhsaft::Cms::AdminController
  # GET /cms/reference_branches
  # GET /cms/reference_branches.json
  def index
    @cms_reference_branches = ReferenceBranch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cms_reference_branches }
    end
  end

  # GET /cms/reference_branches/new
  # GET /cms/reference_branches/new.json
  def new
    @cms_reference_branch = ReferenceBranch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cms_reference_branch }
    end
  end

  # GET /cms/reference_branches/1/edit
  def edit
    @cms_reference_branch = ReferenceBranch.find(params[:id])
  end

  # POST /cms/reference_branches
  # POST /cms/reference_branches.json
  def create
    @cms_reference_branch = ReferenceBranch.new(params[:reference_branch])

    respond_to do |format|
      if @cms_reference_branch.save
        format.html { redirect_to cms_reference_branches_url, notice: t('cms.create.success', name: ReferenceBranch.model_name.human) }
        format.json { render json: @cms_reference_branch, status: :created, location: cms_reference_branches_url }
      else
        format.html { render action: "new" }
        format.json { render json: @cms_reference_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cms/reference_branches/1
  # PUT /cms/reference_branches/1.json
  def update
    @cms_reference_branch = ReferenceBranch.find(params[:id])

    respond_to do |format|
      if @cms_reference_branch.update_attributes(params[:reference_branch])
        format.html { redirect_to cms_reference_branches_url, notice: t('cms.update.success', name: ReferenceBranch.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cms_reference_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/reference_branches/1
  # DELETE /cms/reference_branches/1.json
  def destroy
    @cms_reference_branch = ReferenceBranch.find(params[:id])
    @cms_reference_branch.destroy

    respond_to do |format|
      format.html { redirect_to cms_reference_branches_url }
      format.json { head :no_content }
    end
  end
end
