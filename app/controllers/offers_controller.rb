class OffersController < ApplicationController
  # We need to find the house associated with the offer
  before_action :set_house, only: %i[new create]

  def new
    @house = House.find(params[:house_id])
    @offer = Offer.new
  end

  def create
    @house = House.find(params[:house_id])
    authorize @house
    @offer = Offer.new(offer_params)
    @offer.house = @house
    @offer.user = current_user
    if @offer.save
      redirect_to house_path(@house)
    else
      flash.now[:alert] = "Offer is below the minimum price, please offer higher."
      render 'houses/show', locals: { house: @house, offer: @offer }, status: :unprocessable_entity
    end
  end

  # we don't need a house to destroy,
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to house_path(@offer.house), status: :see_other
  end

  private

  def set_house
    @house = House.find(params[:house_id])
  end

  # strong params
  def offer_params
    params.require(:offer).permit(:price)
  end
end
