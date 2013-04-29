class ReferencesController < ApplicationController

  respond_to :html

  def index
    @references => Reference.active
  end
end
