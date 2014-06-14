class GadgetsController < ApplicationController
  before_action :find_gadget, only: [:show, :edit, :update, :destroy]

  def index
    @gadgets = GadgetSearch.new(current_user).perform(params[:name])
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = current_user.gadgets.create(gadget_params)
    respond_with(@gadget)
  end

  def show
    respond_with(@gadget)
  end

  def edit
    respond_with(@gadget)
  end

  def update
    @gadget.update(gadget_params)
    respond_with(@gadget)
  end

  def destroy
    @gadget.destroy
    respond_with(@gadget)
  end

  private

  def find_gadget
    @gadget = current_user.gadgets.find(params[:id])
  end

  def gadget_params
    params.require(:gadget).permit(:name, pictures_attributes: [:id, :image, :_destroy])
  end
end
