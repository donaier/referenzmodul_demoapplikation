class ReferencesController < ApplicationController

  respond_to :html

  def index
    @references = Reference.active
  end

  def show
    @reference = Reference.active.find(params[:id])
  end
end
