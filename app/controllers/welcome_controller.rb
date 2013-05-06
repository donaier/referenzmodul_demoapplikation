class WelcomeController < ApplicationController

  respond_to :html

  def index
    @showcase_references = Reference.active.showcase
  end
end
