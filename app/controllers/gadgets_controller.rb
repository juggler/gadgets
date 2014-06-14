class GadgetsController < ApplicationController
  def index
    @gadgets = current_user.gadgets
  end
end
