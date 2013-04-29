class ReferencesController < ApplicationController

  respond_to :html

  def index
    @references = Reference.active
  end

  def show
    @reference = Reference.find(params[:id])
  end
end
