class Cms::ReferenceTopicCategoriesController < Kuhsaft::Cms::AdminController
  # GET /cms/reference_topic_categories
  # GET /cms/reference_topic_categories.json
  def index
    @cms_reference_topic_categories = ReferenceTopicCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cms_reference_topic_categories }
    end
  end

  # POST /cms/reference_topic_categories
  # POST /cms/reference_topic_categories.json
  def create
    @cms_reference_topic_category = ReferenceTopicCategory.new(params[:reference_topic_category])

    respond_to do |format|
      if @cms_reference_topic_category.save
        format.html { redirect_to cms_reference_topic_categories_path, notice: t('cms.create.success', name: ReferenceTopicCategory.model_name.human) }
        format.json { render json: @cms_reference_topic_category, status: :created, location: cms_reference_topic_categories_path }
      else
        format.html { render action: "new" }
        format.json { render json: @cms_reference_topic_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/reference_topic_categories/1
  # DELETE /cms/reference_topic_categories/1.json
  def destroy
    @cms_reference_topic_category = ReferenceTopicCategory.find(params[:id])
    @cms_reference_topic_category.destroy

    respond_to do |format|
      format.html { redirect_to cms_reference_topic_categories_url }
      format.json { head :no_content }
    end
  end
end
