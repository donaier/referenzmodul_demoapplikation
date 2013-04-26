class Cms::ReferenceTopicsController < Kuhsaft::Cms::AdminController
  # GET /cms/reference_topics/new
  # GET /cms/reference_topics/new.json
  def new
    @cms_reference_topic = ReferenceTopic.new(:reference_topic_category_id => params[:reference_topic_category_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cms_reference_topic }
    end
  end

  # POST /cms/reference_topics
  # POST /cms/reference_topics.json
  def create
    @cms_reference_topic = ReferenceTopic.new(params[:reference_topic])

    respond_to do |format|
      if @cms_reference_topic.save
        format.html { redirect_to cms_reference_topic_categories_path, notice: t('cms.create.success', name: ReferenceTopic.model_name.human) }
        format.json { render json: @cms_reference_topic, status: :created, location: cms_reference_topic_categories_path }
      else
        format.html { render action: "new" }
        format.json { render json: @cms_reference_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /cms/reference_topics/1/edit
  def edit
    @cms_reference_topic = ReferenceTopic.find(params[:id])
  end

  # PUT /cms/reference_topics/1
  # PUT /cms/reference_topics/1.json
  def update
    @cms_reference_topic = ReferenceTopic.find(params[:id])

    respond_to do |format|
      if @cms_reference_topic.update_attributes(params[:reference_topic])
        format.html { redirect_to cms_reference_topic_categories_path, notice: t('cms.update.success', name: ReferenceTopic.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cms_reference_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/reference_topics/1
  # DELETE /cms/reference_topics/1.json
  def destroy
    @cms_reference_topic = ReferenceTopic.find(params[:id])
    @cms_reference_topic.destroy

    respond_to do |format|
      format.html { redirect_to cms_reference_topic_categories_path }
      format.json { head :no_content }
    end
  end
end
