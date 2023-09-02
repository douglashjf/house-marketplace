class HousesController < ApplicationController
  before_action :set_house, only: %i[show edit update destroy toggle_favourites]


  # GET / houses

  def index
    @houses = policy_scope(House)
  end

  # GET / houses/:id
  def show
    @offer = Offer.new
  end

  # GET / houses/new
  def new
    @house = House.new
    authorize(@house)
  end

  def edit
  end

  def create
    @house = House.new(house_params)
    @house.user = current_user
    authorize(@house)
    if @house.save
      redirect_to house_path(@house)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @house.update(house_params)
    if @house.save
      redirect_to @house
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @house.destroy
    redirect_to houses_path, status: :see_other
  end

  # def category
  #   @category = params[:category]
  #   @houses = House.where(category: @category[0...-1])
  # end

  def toggle_favourites
    if current_user.favourites.exists?(house_id: @house.id)
      current_user.favourites.where(house_id: @house.id).destroy_all
      # flash[:notice] = "Page removed from favourites"
    else
      Favourite.create(user: current_user, house_id: @house.id)
      # flash[:notice] = "Page added to favourites"
    end
  end

  def my_listings
    @user_houses = current_user.houses
  end

  def my_offers
    @user_offers = current_user.offers.includes(:house)
  end

  private

  def set_house
    @house = House.find(params[:id])
    authorize(@house)
  end

  def house_params
    params.require(:house).permit(:photo, :address, :price, :bedroom, :bathroom, :square_feet, :description, :property_type, :tenure)
  end
end
