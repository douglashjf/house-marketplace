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

    @offer = Offer.find(params[:id])

    authorize @offer
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to house_path(@house) }
        format.json
      else
        format.html { render 'house/show', status: :unprocessable_entity }
        format.json
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

  def accept
    offer = Offer.find(params[:id])
    authorize offer

    offer.status = "Accepted"

    if offer.save
      @offer = Offer.new
      @house = offer.house.reload
      @markers = [
        {
          lat: @house.latitude,
          lng: @house.longitude
        }]
      end

      render "houses/show"
  end

  def decline
    offer = Offer.find(params[:id])
    authorize offer

    offer.status = "Declined"

    if offer.save
      @offer = Offer.new
      @house = offer.house
      @markers = [
        {
          lat: @house.latitude,
          lng: @house.longitude
        }]

      render "houses/show"
    else
      puts offer.errors.full_messages
    end
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
