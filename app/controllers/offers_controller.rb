class OffersController < ApplicationController
  # We need to find the house associated with the offer
  before_action :set_house, only: %i[new update create]

  def new
    @offer = Offer.new
  end

  def create
    authorize @house
    @offer = Offer.new(offer_params)
    @offer.house = @house
    @offer.user = current_user

    if @offer.save
      redirect_to house_path(@house)
    else
      render "houses/show", status: :unprocessable_entity
    end
  end

  # def edit
  #   authorize @house
  #   @offer = Offer.find(params[:id])
    # authorize @offer
  # end

  def update
    authorize @house
    @offer = Offer.find(params[:id])

    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to house_path(@house) }
        format.js
      else
        format.html { render 'house/show', status: :unprocessable_entity }
        format.js
      end
    end
  end

  # we don't need a house to destroy,
  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.destroy
    redirect_to house_path(@offer.house), status: :see_other
  end

  private

  def set_house
    @house = House.find(params[:house_id])
  end

  # strong params
  def offer_params
    params.require(:offer).permit(:price, :status)
  end
end
